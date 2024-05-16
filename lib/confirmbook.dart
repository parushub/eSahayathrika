
import 'package:flutter/material.dart';
import 'package:saha_new/emergency.dart';

class ConfirmBookPage extends StatelessWidget {
  final Map<String, dynamic> userData; // Define userData as a parameter

  ConfirmBookPage({required this.userData}); // Constructor to receive userData
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Booking'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text: 'Your trip booked successfully'
            Text(
              'Your trip booked successfully',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            // Driver's photo with rating and vehicle details
            ListTile(
              // leading: CircleAvatar(
              //   backgroundImage: AssetImage('assets/driver_photo.jpg'), // Placeholder for driver's photo
              // ),
              title: Text("Driver's Name"),
              subtitle: Row(
                children: [
                  Icon(Icons.star,
                      color: Colors.yellow), // Placeholder for rating
                  SizedBox(width: 5.0),
                  Text('4.5'), // Placeholder for rating value
                ],
              ),
            ),
            SizedBox(height: 20.0),
            // Vehicle details enclosed in a box
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vehicle Details:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text('Model: '), // Placeholder for vehicle model
                  Text('Color: '), // Placeholder for vehicle color
                  Text(
                      'License Plate No.:'), // Placeholder for license plate number
                  Text('Arrival Time:'), // Placeholder for arrival time
                ],
              ),
            ),
            SizedBox(height: 20.0),
            // Text: 'Enjoy your journey'
            Text(
              'Enjoy your journey',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            // Confirm button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Emergency(userData: userData)),
                  );
                  // Handle confirm button pressed
                },
                child: Text('Confirm'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
