import 'package:flutter/material.dart';
import 'EditProfilePage.dart';
import 'ChangePasswordPage.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SETTINGS'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/BG.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Edit Profile'),
              leading: const Icon(Icons.person),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfilePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Change Password'),
              leading: const Icon(Icons.lock),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Delete Account'),
              leading: const Icon(Icons.delete),
              onTap: () {
              },
            ),
            ListTile(
              title: const Text('Nationality'),
              leading: const Icon(Icons.account_circle),
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}