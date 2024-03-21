import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/registration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> loginUser() async {
    // Simulate a login process
    // In a real app, you would make an HTTP request here
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Mock login success condition
    if (username.isNotEmpty && password.isNotEmpty) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // If the login fails, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color(0xFF106B13),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: UnderlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: const Color(0xFF106B13),
                foregroundColor: Colors.white,
              ),
              onPressed: loginUser,
              child: const Text('Login'),
            ),
            TextButton(
              // Style for your register button
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF106B13), // Text color
              ),
              onPressed: () {
                // Navigate to the RegistrationScreen when the button is pressed
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const RegistrationScreen()),
                );
              },
              child: const Text('Create a new account'),
            ),
          ],
        ),
      ),
    );
  }
}
