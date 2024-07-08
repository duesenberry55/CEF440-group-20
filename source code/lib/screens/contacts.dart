import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:g20dms/constants.dart';
import 'package:g20dms/contact_item.dart';
import 'package:g20dms/custom_button.dart';
import 'package:g20dms/custom_textfield.dart';
// import 'package:g20dms/screens/send_alert.dart';
import 'package:g20dms/screens/send_contact.dart';
import 'package:g20dms/showpop.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class ContactListingScreen extends StatefulWidget {
  static const id = 'contacts';

  String? label = 'police';
  bool? isAdmin = false;

  ContactListingScreen({super.key, this.label, this.isAdmin});

  @override
  State<ContactListingScreen> createState() => _ContactListingScreenState();
}

class _ContactListingScreenState extends State<ContactListingScreen> {
  TextEditingController search = TextEditingController();

  List contacts = [];
  bool loading = false;

  Future<void> fetchContacts(String type) async {
    setState(() {
      loading = true;
    });

    try {
      // final response = await http.get(Uri.parse('$contactsUrl$type'));
      final response = await http.get(Uri.parse('$contactsUrl$type'));
      print(contactsUrl);
      print(type);

      if (response.statusCode == 200) {
        setState(() {
          contacts = jsonDecode(response.body);
          print(contacts);
        });
      } else {
        showPopupMessage(context, 'Error', 'unable to load contacts');
      }
    } catch (e) {
      print(e);
    }

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchContacts(widget.label ?? 'police');
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF003366),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            // padding: EdgeInsets.all(0),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.label ?? 'police',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Center(
                child: Text(
                  'FR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(90.0),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    hint: 'Molyko police',
                    label: 'Search',
                    controller: search,
                    isSearch: true,
                  )
                ],
              ),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10),
              // Contact List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: contacts.length > 0
                      ? contacts.length
                      : 1, // Number of contacts
                  itemBuilder: (context, index) {
                    print(index);
                    print(widget.isAdmin);
                    return (contacts.length <= 0 && widget.isAdmin == true)
                        ? CustomButton(
                            text: 'Add Contacts',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SendContactScreen(
                                            type: widget.label ?? 'police',
                                          ))).then((value) =>
                                  fetchContacts(widget.label ?? 'police'));
                            },
                          ): Column(
                            children: [
                              ContactItem(
                                phone: contacts[index]['phone'],
                                type: widget.label,
                                title: contacts[index]['title'],
                                location:
                                    '${contacts[index]['location'].toString()}',
                              ),
                              SizedBox(height: 20),
                              if ((widget.isAdmin ?? false) &&
                                  index == contacts.length - 1)
                                CustomButton(
                                  text: 'Add Contacts',
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SendContactScreen(
                                                  type:
                                                      widget.label ?? 'police',
                                                ))).then((value) =>
                                        fetchContacts(
                                            widget.label ?? 'police'));
                                  },
                                ),
                            ],
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
