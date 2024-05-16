//import 'package:e_sahayat/last.dart';
import 'package:flutter/material.dart';
import 'package:saha_new/last.dart';
//import 'package:esahayathrika/last.dart';

class Rating extends StatelessWidget {
  final Map<String, dynamic> userData; // Define userData as a parameter

  Rating({required this.userData}); // Constructor to receive userData
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Congratulations on completing your journey safely with Sahayathrika!',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 300.0, // Adjust the width as needed
                padding: EdgeInsets.all(10.0),
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      'Rate your journey',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your feedback',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LastPage(userData: userData as Map<String, dynamic>)),
                  );
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
