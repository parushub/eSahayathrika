import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:saha_new/booknow.dart';
import 'package:saha_new/booknow1.dart';
import 'package:saha_new/booknow3.dart';
import 'package:saha_new/login.dart';
import 'package:saha_new/login1.dart';

// Define the home page widget
class HomePage extends StatefulWidget {
  // final User? user;
  //
  // HomePage({Key? key, required this.user}) : super(key: key);

  final Map<String, dynamic> userData;

  HomePage({required this.userData});


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // You can add initialization logic here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.video_library),
            onPressed: () {
              // Handle demo video button pressed
              // You can navigate to a video screen or any other action here
            },
          ),
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'logout') {
                // Handle logout option
                FirebaseAuth.instance.signOut(); // Sign out the user
                // Navigate to login page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'about',
                  child: Text('About'),
                ),
                PopupMenuItem(
                  value: 'logout',
                  child: Text('Logout'),
                ),
              ];
            },
          ),

        ],
      ),
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
            SizedBox(height: 20.0),
            // Greeting text
            Text(
              'Hello, welcome to e-Sahayathrika!',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            // Subtitle
            Text(
              'Ready for a ride?',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            // Book now button
            ElevatedButton(
              onPressed: () {
                // Navigate to the book now page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookNowPage(userData: widget.userData)),
                );
              },
              child: Text('Book now'),
            ),
          ],
        ),
      ),
    );
  }
}

