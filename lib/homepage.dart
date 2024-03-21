import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> savedLots = [
    'Lot 1',
    'Lot 2',
    'Lot 3',
    // Add more lots as needed...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Welcome User'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[300],
            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: savedLots.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.location_on, color: Colors.green),
                  title: Text(savedLots[index]),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.green),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.green, // Text color
              ),
              onPressed: () {
                // Add more lots
              },
              child: Text('Add more'),
            ),
          ),
        ],
      ),
    );
  }
}
