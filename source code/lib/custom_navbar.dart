import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final bool isAdmin;
  final Function(int) onTap;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    required this.isAdmin,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Color(0xFF003366),
      selectedItemColor: Color.fromARGB(255, 185, 248, 255),
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: isAdmin ? 'Emergencies' : 'Alerts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
