import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;

  CustomAppBar({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          title,
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
          child: const Column(
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
                'Name',
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 90);
}
