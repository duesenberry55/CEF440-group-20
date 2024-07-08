// contact_item.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ContactItem extends StatelessWidget {
  final String title;
  final String location;
  final int phone;
  String? type;

  ContactItem({
    required this.title,
    required this.location,
    required this.phone,
    this.type,
  });

  void launchPhoneDialer(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    String path = 'assets/police.png';
    if (type == 'fire rescue') {
      path = 'assets/fire fighter.png';
    } else if (type == 'hospital') {
      path = 'assets/hospital.png';
    }

    return GestureDetector(
      onTap: () {
        launchPhoneDialer(phone.toString());
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 0.5),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                path, // Replace with your asset path
                width: 40,
              ),
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
                Text('$phone| $location'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
