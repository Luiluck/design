import 'package:flutter/material.dart';
import 'MainPage.dart';
import 'SignupPage.dart';
import '../services/user.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    String _userEmail = "";
    String _userPass = "";

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    Userservice userService = Userservice(); // Instantiate UserService

    return Scaffold(
      body: Stack(
        children: [
          // Background image container
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/orange.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/lockblack.png', // Replace 'lock_image.png' with your actual image asset path
                    width: 150, // Adjust width as needed
                    height: 150, // Adjust height as needed
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 36, // Increased font size to 36
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {
                      _userEmail = value;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Username',
                      prefixIcon: Icon(Icons.person),
                    ),
                    style: const TextStyle(fontSize: 18), // Increased font size to 18
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value) {
                      _userPass = value;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    style: const TextStyle(fontSize: 18), // Increased font size to 18
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // Call the UserService login method
                            bool success = await userService.login(
                              _userEmail,
                              _userPass,
                            );
                            if (success) {
                              // Show loading indicator while navigating
                              showDialog(
                                context: context,
                                barrierDismissible: false, // Prevent dismiss by tapping outside
                                builder: (BuildContext context) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  );
                                },
                              );
                              // Delay navigation to demonstrate loading indicator (replace with your actual navigation)
                              await Future.delayed(const Duration(seconds: 2));
                              // If login is successful, navigate to the main page
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const MainPage()),
                              );
                            } else {
                              // If login fails, display a SnackBar with an error message
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Invalid email or password'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 20), // Increased font size to 20
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(fontSize: 16), // Increased font size to 16
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignupPage()),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 16, // Increased font size to 16
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
