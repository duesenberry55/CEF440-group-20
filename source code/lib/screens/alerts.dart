import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:g20dms/constants.dart';
import 'package:g20dms/custom_button.dart';
import 'package:g20dms/custom_navbar.dart';
import 'package:g20dms/custom_textfield.dart';
import 'package:g20dms/screens/send_alert.dart';
import 'package:g20dms/screens/user_dashboard.dart';
import 'package:g20dms/showpop.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:g20dms/custom_button.dart';

// ignore: must_be_immutable
class AlertScreen extends StatefulWidget {
  static const id = 'alerts';

  AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  TextEditingController search = TextEditingController();

  String args = '';

  bool isUser = false;

  bool isAdmin = false;

  bool isRespond = false;

  bool loading = false;

  List alerts = [];

  Future<void> fetchAlerts(String type) async {
    setState(() {
      loading = true;
    });

    try {
      final response = await http.get(Uri.parse('$alertsUrl$type'));

      if (response.statusCode == 200) {
        setState(() {
          alerts = jsonDecode(response.body);
          print(alerts);
        });
      } else {
        showPopupMessage(context, 'Error', 'unable to load alerts');
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
    fetchAlerts('alert');
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as String;

    if (args == 'user') {
      isUser = true;
    } else if (args == 'admin') {
      isAdmin = true;
    } else if (args == 'respond') {
      isRespond = true;
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
              'Alerts',
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
                  ),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: alerts.map((emergency) {
                          return Column(
                            children: [
                              EmergencyItem(
                                title:
                                    '${emergency['title']} | ${emergency['incidentType']}',
                                description: emergency['note'],
                                location: emergency['location'],
                              ),
                              SizedBox(height: 10),
                            ],
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      if (isAdmin)
                        CustomButton(
                          text: 'Add alerts',
                          onPressed: () {
                            Navigator.pushNamed(context, SendAlertsScreen.id).then((value) {
                              fetchAlerts('alert');
                            });
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: (!isAdmin)
            ? CustomBottomNavigationBar(
                isAdmin: isAdmin,
                currentIndex: 0,
                onTap: (index) {
                  if (index == 1) {
                    if (!isAdmin) {
                      Navigator.popAndPushNamed(
                        context,
                        UserDashboardScreen.id,
                        arguments: args,
                      );
                    }
                  }
                },
              )
            : null,
      ),
    );
  }
}
