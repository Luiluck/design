import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});
  @override
  ChangePasswordPageState createState() => ChangePasswordPageState();
}

class ChangePasswordPageState extends State<ChangePasswordPage> {
  String _oldPassword = '';
  String _newPassword = '';
  String _confirmNewPassword = '';

  void _changePassword() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/BG.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Change Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Protect your account with a strong and unique password',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Old Password'),
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _oldPassword = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'New Password'),
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _newPassword = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Rewrite New Password'),
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _confirmNewPassword = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _changePassword,
                  child: const Text('Change Password'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
