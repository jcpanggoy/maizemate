import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF106B13), // Your custom color
          onPrimary: Color(0xFF106B13), // Text color on top of the primary color
          secondary: Color(0xFF106B13), // You can adjust this as needed
          onSecondary: Colors.white, // Text color on top of the secondary color
          error: Colors.red, // Default or custom error color
          onError: Colors.white, // Text color on top of the error color
          background: Colors.white, // Background color of your app
          onBackground: Colors.black, // Text color on the background
          surface: Colors.white, // Surface color, e.g., cards, sheets
          onSurface: Colors.black, // Text color on top of surface colors
        ),
      ),
      home: const LoginScreen(), // Your registration screen is now here
    );
  }
}
