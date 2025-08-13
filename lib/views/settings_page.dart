import 'package:flutter/material.dart';
import '/widgets/bottom_nav_bar.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final Color cardColor = Colors.white;
  final Color iconColor = Colors.grey.shade800;
  final double iconSize = 26;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSettingsCard([
              buildSettingItem(Icons.person, 'Profile'),
              buildDivider(),
              buildSettingItem(Icons.notifications, 'Notifications'),
              buildDivider(),
              buildSettingItem(Icons.lock, 'Privacy'),
              buildDivider(),
              buildSettingItem(Icons.color_lens, 'Theme'),
              buildDivider(),
              buildSettingItem(Icons.account_balance_wallet, 'Payments'),
              buildDivider(),
              buildSettingItem(Icons.info, 'About'),
            ]),
            const SizedBox(height: 24),
            const Text(
              'Support',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            buildSettingsCard([
              buildSettingItem(Icons.help, 'Help & Support'),
              buildDivider(),
              buildSettingItem(Icons.feedback, 'Send Feedback'),
            ]),
            const SizedBox(height: 24),
            const Text(
              'Contact',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.black,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            buildSettingsCard([
              buildSettingItem(Icons.email, 'Gmail'),
              buildDivider(),
              buildSettingItem(Icons.link, 'LinkedIn'),
              buildDivider(),
              buildSettingItem(Icons.facebook, 'Facebook'),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }

  Widget buildSettingsCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget buildSettingItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: iconColor, size: iconSize),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: () {},
    );
  }

  Widget buildDivider() {
    return Divider(height: 1, thickness: 0.8, color: Colors.grey.shade300);
  }
}
