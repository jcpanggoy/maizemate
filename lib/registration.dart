import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For encoding the data to JSON
import 'login.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

Future<void> registerUser() async {
  try {
    var url = Uri.parse('http://192.168.254.104:5000/api/users'); // Make sure to use the correct server URL
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
      'name': _nameController.text,
      'phoneNumber': _phoneNumberController.text, // Corrected key to 'phoneNumber'
      'username': _usernameController.text,
      'password': _passwordController.text,
          }),
        );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('User registered successfully'),
        backgroundColor: Colors.green,
      ));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to register'),
        backgroundColor: Colors.red,
      ));
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Error: $e'),
      backgroundColor: Colors.red,
    ));
    print(e);
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        backgroundColor: const Color(0xFF106B13),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: UnderlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: const Color(0xFF106B13),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                registerUser();
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
