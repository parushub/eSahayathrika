//import 'package:e_sahayat/home.dart';
import 'package:flutter/material.dart';
import 'package:saha_new/home.dart';

class LastPage extends StatelessWidget {
  final Map<String, dynamic> userData; // Define userData as a parameter

  LastPage({required this.userData}); // Constructor to receive userData

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Add leading icon button to navigate back to home page
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to home page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage(userData: userData as Map<String, dynamic>)),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Widget
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: Image.asset(
                'assets/logo.png', // Change 'assets/logo.png' to your actual logo image path
                width: 100.0, // Adjust the width of the logo as needed
                height: 100.0, // Adjust the height of the logo as needed
              ),
            ),
            // Text Widget
            Text(
              'Thank you for choosing Sahayathrika',
              style: TextStyle(
                fontSize: 18.0, // Adjust the font size of the text as needed
                fontWeight: FontWeight.bold,
              ),
            ),
            // Button Widget
            ElevatedButton(
              onPressed: () {
                // Navigate back to home page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage(userData: userData as Map<String, dynamic>)),
                );
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
