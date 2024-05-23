import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final List<Map<String, dynamic>> foodHistory = [
    {'name': 'Pizza', 'imagePath': 'assets/pizza.jpg', 'date': DateTime.now()},
    {'name': 'Salad', 'imagePath': 'assets/salad.jpg', 'date': DateTime.now()},
    // Add more sample food items
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample History'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/BG.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: foodHistory.length,
          itemBuilder: (context, index) {
            return _buildFoodItem(context, foodHistory[index]);
          },
        ),
      ),
    );
  }

  Widget _buildFoodItem(BuildContext context, Map<String, dynamic> food) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            food['imagePath'],
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food['name'],
                  style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Date: ${food['date'].toString()}',
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
