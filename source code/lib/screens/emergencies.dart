import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:g20dms/constants.dart';
import 'package:g20dms/custom_navbar.dart';
import 'package:g20dms/custom_textfield.dart';
// import 'package:g20dms/screens/alerts.dart';
import 'package:g20dms/screens/user_dashboard.dart';
import 'package:g20dms/showpop.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// import 'package:g20dms/custom_button.dart';

// ignore: must_be_immutable
class EmergencyScreen extends StatefulWidget {
  static const id = 'emergency';

  EmergencyScreen({super.key});

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  TextEditingController search = TextEditingController();

  bool? isAdmin = false;

  String args = '';

  List emergencies = [];

  bool loading = false;

  Future<void> fetchEmergencies(String type) async {
    setState(() {
      loading = true;
    });

    try {
      // final response = await http.get(Uri.parse('$contactsUrl$type'));
      final response = await http.get(Uri.parse('$alertsUrl$type'));

      if (response.statusCode == 200) {
        setState(() {
          emergencies = jsonDecode(response.body);
          print(emergencies);
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
    fetchEmergencies('emergency');
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      args = ModalRoute.of(context)!.settings.arguments as String;
      isAdmin = true;
    }

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
              'Emergencies',
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
                    hint: 'earth quake',
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      // Emergency List
                      Column(
                        children: emergencies.map((emergency) {
                          return Column(
                            children: [
                              EmergencyItem(
                                title: '${emergency['title']} | ${emergency['incidentType']}',
                                description: emergency['note'],
                                location: emergency['location'],
                              ),
                              SizedBox(height: 10),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          isAdmin: isAdmin ?? false,
          currentIndex: 0,
          onTap: (index) {
            if (index == 1) {
              Navigator.popAndPushNamed(
                context,
                UserDashboardScreen.id,
                arguments: args,
              );
            }
          },
        ),
      ),
    );
  }
}
