import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'AboutPage.dart';
import 'LoginPage.dart';
import 'Settings.dart';
import 'AccountDisplayPage.dart';
import 'camera.dart';
import 'HistoryPage.dart'; // Import the HistoryPage

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Users'),
      ),
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/food.jpg'), // Change the image path as needed
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Menu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.black),
                title: const Text('Settings', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.support, color: Colors.black),
                title: const Text('Account', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AccountDisplayPage(firstName: '', lastName: '', height: '', weight: '', cholesterol: '',)),
                  );
                },
              ),
              // Insert the ListTile for the About page here
              ListTile(
                leading: const Icon(Icons.food_bank, color: Colors.black),
                title: const Text('About', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.history, color: Colors.black), // Added icon for History
                title: const Text('History', style: TextStyle(color: Colors.black)), // Added title for History
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryPage()), // Navigate to HistoryPage
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.black),
                title: const Text('Logout', style: TextStyle(color: Colors.black)),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                        (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/BG.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Main content
          const Center(
            child: Text('MyCalorieLensSampleMainPage'),
          ),
          // Buttons on background
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  height: 1, // Height of the line
                  width: double.infinity,
                  color: Colors.grey, // Color of the line
                ),
                const SizedBox(height: 8), // Add some space between line and icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        _showFoodHistory(context);
                      },
                      icon: const Icon(Icons.history, size: 32), // Increased size
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CameraCapturePage()),
                        );
                      },
                      icon: const Icon(Icons.camera_alt, size: 32), // Increased size
                    ),
                    IconButton(
                      onPressed: () {
                        _showCalorieTracker(context);
                      },
                      icon: const Icon(Icons.accessibility_new, size: 32), // Increased size
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final pickedImage =
    await ImagePicker().pickImage(source: source);
    if (pickedImage == null) return;
    final File imageFile = File(pickedImage.path);
    _sendImageToBackend(context, imageFile);
  }

  Future<void> _sendImageToBackend(BuildContext context, File imageFile) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://us-central1-soilproject-91ac2.cloudfunctions.net/app/api/v1/upload'),
    );
    request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      print('SampleSentFood');
      // print(response);
    } else {
      print('Sample failed to send image. Error: ${response.reasonPhrase}');
    }
  }

  void _showFoodHistory(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Food History'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Sample food 1 clicked!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text('Sample food history item 1'),
                ),
                const Text('Sample food history item 2'),
                const Text('Sample food history item 3'),
                // Add more sample food history items as needed
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showCalorieTracker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Calorie Tracker'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Today\'s calories: 1500'),
                Text('Target calories: 2000'),
                Text('Remaining calories: 500'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
