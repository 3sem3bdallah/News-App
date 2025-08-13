// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:news/views/home_page.dart';
import 'package:news/views/settings_page.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  const BottomNavBar({super.key, required this.currentIndex});

  void _onTap(BuildContext context, int index) {
    if (index == currentIndex) return;
    Widget page;
    switch (index) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = SettingsPage();
        break;
      default:
        return;
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 50,
            spreadRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xFF6200EA),
        backgroundColor: Colors.grey.shade200,
        unselectedItemColor: Colors.black,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        onTap: (index) => _onTap(context, index),
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.home, currentIndex == 0),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.settings, currentIndex == 1),
            label: "Settings",
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon, bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected
            ? const Color(0xFF6200EA).withOpacity(0.1)
            : Colors.transparent,
      ),
      child: Icon(
        icon,
        size: 28,
        color: isSelected ? const Color(0xFF6200EA) : Colors.black,
      ),
    );
  }
}
