import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:g20dms/constants.dart';
import 'package:g20dms/custom_button.dart';
import 'package:g20dms/custom_navbar.dart';
import 'package:g20dms/screens/alerts.dart';
import 'package:g20dms/screens/contacts.dart';
import 'package:g20dms/screens/emergencies.dart';
import 'package:g20dms/screens/send_emergency.dart';
import 'package:g20dms/screens/send_report.dart';
import 'package:g20dms/showpop.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class UserDashboardScreen extends StatefulWidget {
  static const id = 'userdashboard';

  UserDashboardScreen({super.key});

  @override
  State<UserDashboardScreen> createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  bool isUser = false;

  bool isAdmin = false;

  bool isRespond = false;

  late SharedPreferences prefs ;


  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  // String args = '';

  String title = 'User';

  bool loading = false;

  List emergencies = [];

  Future<void> fetchEmergencies(String type) async {
    setState(() {
      loading = true;
    });

    try {
      final response = await http.get(Uri.parse('$alertsUrl$type'));

      if (response.statusCode == 200) {
        setState(() {
          emergencies = jsonDecode(response.body);
          print(emergencies);
        });
      } else {
        showPopupMessage(context, 'Error', 'unable to load emergencies');
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
    initSharedPref();

    fetchEmergencies('emergency');
    super.initState();

  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    String args = ModalRoute.of(context)!.settings.arguments as String;

    // if(count <= 0){
    //   setState(() {
    //     args;
    //   });

    //   count++;
    // }

    print(args);

    if (args == 'user') {
      isUser = true;
      title = 'User';
    } else if (args == 'admin') {
      isAdmin = true;
      title = 'Admin';
    } else if (args == 'respond') {
      isRespond = true;
      title = 'Respondent';
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
              '$title Dashboard',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          actions: [
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
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    prefs.getString('name')??'Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isAdmin)
                        Column(
                          children: [
                            const Text(
                              'Emergencies',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            // Emergency List
                            Column(
                              children: emergencies.map((emergency) {
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
                            SizedBox(height: 10),
                            // See All Button
                            CustomButton(
                              text: 'See all',
                              onPressed: () {
                                // Handle See all button press
                                Navigator.pushNamed(
                                    context, EmergencyScreen.id);
                              },
                            ),
                          ],
                        ),
                      SizedBox(height: 20),
                      // Services Grid
                      const Text(
                        'Services',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        physics: const NeverScrollableScrollPhysics(),
                        children: (isRespond)
                            ? [
                                ServiceItem(
                                  icon: Icons.send,
                                  label: 'Send report',
                                  color: Colors.blue,
                                ),
                              ]
                            : [
                                ServiceItem(
                                  icon: Icons.fire_extinguisher,
                                  label: 'Fire rescue',
                                  color: Colors.red,
                                  args: args,
                                ),
                                ServiceItem(
                                  icon: Icons.local_police,
                                  label: 'Police',
                                  color: Color.fromARGB(255, 0, 44, 154),
                                  args: args,
                                ),
                                ServiceItem(
                                  icon: Icons.local_hospital,
                                  label: 'Hospital',
                                  color: Colors.green,
                                  args: args,
                                ),
                                ServiceItem(
                                  icon: Icons.health_and_safety,
                                  label: 'Safety tips',
                                  color: Colors.red,
                                  args: args,
                                ),
                                ServiceItem(
                                  icon: Icons.security,
                                  label: 'Emergency preparedness',
                                  color: const Color.fromARGB(255, 132, 120, 9),
                                  args: args,
                                ),
                                ServiceItem(
                                  icon: Icons.medical_services,
                                  label: 'First aid tips',
                                  color: Colors.red,
                                  args: args,
                                ),
                                ((isAdmin)
                                    ? ServiceItem(
                                        icon: Icons.send,
                                        label: 'Send directives',
                                        color: Colors.blue,
                                        args: args,
                                      )
                                    : ServiceItem(
                                        icon: Icons.send,
                                        label: 'Send emergency',
                                        color: Colors.blue,
                                        args: args,
                                      )),
                                ((isAdmin)
                                    ? ServiceItem(
                                        icon: Icons
                                            .notification_important_outlined,
                                        label: 'Alerts',
                                        color: Colors.red,
                                        args: args,
                                      )
                                    : ServiceItem(
                                        icon: Icons.location_on,
                                        label: 'Share location',
                                        color: Colors.green,
                                        args: args,
                                      )),
                                if (isAdmin)
                                  ServiceItem(
                                    icon: Icons.report_problem_sharp,
                                    label: 'Reports',
                                    color: Color.fromARGB(255, 0, 44, 154),
                                  )
                              ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          isAdmin: isAdmin,
          currentIndex: 1,
          onTap: (index) {
            if (index == 0) {
              if (!isAdmin) {
                Navigator.popAndPushNamed(context, AlertScreen.id,
                    arguments: args);
              } else {
                Navigator.popAndPushNamed(context, EmergencyScreen.id,
                    arguments: args);
              }
            }
          },
        ),
      ),
    );
  }
}

class EmergencyItem extends StatelessWidget {
  final String title;
  final String description;
  final String location;

  EmergencyItem({
    required this.title,
    required this.description,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/red light.png',
                width: 40,
              )
              // Icon(
              //   Icons.access_alarms,
              //   color: Colors.red,
              //   size: 40,
              // ),
              ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 3),
              Text(description),
              Text(location),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ServiceItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final args;

  bool? isUser;
  bool? isAdmin;
  bool? isRespond;

  ServiceItem({required this.icon, required this.label, this.color, this.args});

  @override
  Widget build(BuildContext context) {
    print(args);

    if (args == 'user') {
      isUser = true;
    } else if (args == 'admin') {
      isAdmin = true;
    } else if (args == 'respond') {
      isRespond = true;
    }

    return GestureDetector(
      onTap: () {
        if (label.toLowerCase() == 'send emergency') {
          Navigator.pushNamed(context, SendEmergencyScreen.id);
        } else if (label.toLowerCase() == 'send report') {
          Navigator.pushNamed(context, SendReportScreen.id);
        } else if (label.toLowerCase() == 'send directives' ||
            label.toLowerCase() == 'safety tips' ||
            label.toLowerCase() == 'first aid tips' ||
            label.toLowerCase() == 'emergency preparedness' ||
            label.toLowerCase() == 'reports'||
            label.toLowerCase() == 'share location') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Unavailable'),
                content: Text('This feature is not yet avaiblable🥲'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
          print('This feature is not yet avaiblable');
        } else if (label.toLowerCase() == 'alerts') {
          Navigator.pushNamed(context, AlertScreen.id, arguments: args);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactListingScreen(
                label: label,
                isAdmin: isAdmin,
              ),
            ),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[200],
            child: Icon(icon, size: 30, color: color ?? Colors.black),
          ),
          SizedBox(height: 10),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
