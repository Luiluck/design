import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
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
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  'assets/cameralenss.jpg', // Replace 'assets/cameralenss.jpg' with your image file path
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Welcome to CalorieLens, your ultimate companion for making informed dietary choices on the go. Powered by cutting-edge technology, our app revolutionizes how you recognize, analyze, and manage your meals, all from the convenience of your smartphone.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                    // Adjust the fontSize, color, and fontWeight properties here
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Show dialog with key features
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          title: Text('Key Features'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FeatureItem(
                                title: 'Food Recognition:',
                                description:
                                'Instantly identify a variety of common Filipino dishes using advanced deep learning models.',
                              ),
                              FeatureItem(
                                title: 'Ingredient Analysis:',
                                description:
                                'Dive deep into the nutritional composition of recognized dishes, catering to specific dietary requirements and restrictions.',
                              ),
                              FeatureItem(
                                title: 'Calorie Estimation:',
                                description:
                                'Seamlessly estimate and monitor your daily caloric intake, empowering you to maintain a balanced diet and achieve your health goals.',
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Key Feature',
                    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                    // Adjust the fontSize, color, and fontWeight properties here
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Info:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25, // Increased font size
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Got questions or feedback? We\'d love to hear from you!',
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Email: samplelens@gmail.com',
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                      Text(
                        'Social Media: samplecalorieLens.com',
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String title;
  final String description;

  const FeatureItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
