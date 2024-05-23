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
        leading: IconButton( // Using an IconButton for the back button
          icon: const Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Navigate back when pressed
          },
        ),
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
            const SizedBox(height: 40), // Adding space between app bar and first list tile
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
            const Divider(), // Adding a Divider widget for spacing
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
            const Divider(), // Adding a Divider widget for spacing
            ListTile(
              title: const Text('Delete Account'),
              leading: const Icon(Icons.delete),
              onTap: () {
                // Handle delete account action
              },
            ),
          ],
        ),
      ),
    );
  }
}
