import 'package:flutter/material.dart';
import 'LoginPage.dart';
import '../services/user.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Userservice userService = Userservice();

  String _userEmail = "";
  String _userPass = "";
  String _confirmPass = "";
  String _firstName = "";
  String _lastName = "";
  String _height = "";
  String _weight = "";
  String _cholesterol = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/orange.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your email';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _userEmail = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'First Name',
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your first name';
                            }
                            if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                              return 'Use alphabetic characters';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _firstName = value;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Last Name',
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your last name';
                            }
                            if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                              return 'Use alphabetic characters';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _lastName = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Height',
                      prefixIcon: Icon(Icons.height),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your height';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _height = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Weight',
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your weight';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _weight = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Cholesterol',
                      prefixIcon: Icon(Icons.favorite),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter cholesterol level';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _cholesterol = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a Password';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _userPass = value;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm your password';
                      }
                      if (value != _userPass) {
                        return 'Password not matched';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _confirmPass = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await userService.signUp(
                          _userEmail,
                          _userPass,
                          _firstName,
                          _lastName,
                          _height,
                          _weight,
                          _cholesterol,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      }
                    },
                    child: const Text('Sign Up'),
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
