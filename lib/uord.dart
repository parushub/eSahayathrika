
import 'package:flutter/material.dart';
import 'package:saha_new/driverlogin.dart';
import 'package:saha_new/driverlogin1.dart';
import 'package:saha_new/driverlogin2.dart';
import 'package:saha_new/driverlogin3.dart';
import 'package:saha_new/driverlogin4.dart';
import 'package:saha_new/home.dart';
import 'package:saha_new/login.dart';
import 'package:saha_new/login1.dart';

class UserTypeSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/logo.png', // Path to your logo image
              width: 150.0,
              height: 150.0,
            ),
            SizedBox(height: 40.0),
            // User button
            ElevatedButton.icon(
              onPressed: () {
                // Handle user button pressed
                // Navigate to login page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              icon: Icon(Icons.person),
              label: Text('User'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              ),
            ),
            SizedBox(height: 20.0),
            // Driver button
            ElevatedButton.icon(
              onPressed: () {
                // Handle driver button pressed
                // Navigate to DriverPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DriverLoginPage()),
                );
              },
              icon: Icon(Icons.directions_car),
              label: Text('Driver'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
