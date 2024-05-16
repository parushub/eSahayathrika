//import 'package:e_sahayat/rating.dart';
import 'package:flutter/material.dart';
import 'package:saha_new/rating.dart';

class Emergency extends StatelessWidget {
  final Map<String, dynamic> userData; // Define userData as a parameter

  Emergency({required this.userData}); // Constructor to receive userData
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        /* leading: Container(), // Empty container to center the leading widget
        actions: [
          Container(), // Empty container to balance the centering
        ],*/
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Icon(Icons.warning, size: 48.0), // Centered Icon
              ),
              Center(
                  child: Text(
                    'Are you in an Emergency?',
                    style: TextStyle(fontSize: 24.0),
                  )),
              SizedBox(height: 20.0),
              ListTile(
                title: Text(
                  'Safety Response team will contact you immediately as you click on ALERT NOW',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Handle ALERT NOW button pressed
                },
                child: Text('ALERT NOW'),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Rating(userData: userData)),
                  );
                },
                child: Text('CANCEL'),
                style: ElevatedButton.styleFrom(
                  padding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
