import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saha_new/Driverlast.dart';
import 'package:saha_new/driverlogin.dart';
import 'package:saha_new/driverlogin2.dart';
import 'package:saha_new/driverlogin3.dart';
import 'package:saha_new/driverlogin4.dart';
import 'package:saha_new/popup.dart';
import 'package:saha_new/uord.dart';
// import 'package:sample/driverlast.dart';
// import 'package:sample/driverlogin.dart';
// import 'package:sample/popup.dart';
// import 'package:sample/uord.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
class DriverPage extends StatefulWidget {
  final Map<String, dynamic>? driverDetails;

  DriverPage({Key? key, this.driverDetails}) : super(key: key);

  @override
  _DriverPageState createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  late bool isAvailable;
  late CollectionReference driverCollection;
  String latitude = '';
  String locationName = ''; // Added to store location nam
  String longitude = '';

  @override
  void initState() {
    super.initState();
    isAvailable = false;
    driverCollection = FirebaseFirestore.instance.collection('driver');
    debugPrint('Driver Page Initialized');
  }

  @override
  Widget build(BuildContext context) {
    // Initially set to false
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserTypeSelectionPage(),
              ), // Navigate to UserTypeSelectionPage
            );
          },
        ),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'logout') {
                // Handle logout option
                // Navigate to login page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DriverLoginPage()),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Availability Toggle Switch
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Availability',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10.0),
                Switch(
                  value: isAvailable,
                  onChanged: (bool newValue) {
                    setState(() {
                      isAvailable = newValue;
                    });
                    updateAvailability(newValue);
                  },
                ),
              ],
            ),
          ),
          // Centered Greetings Text Widget
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Greetings, ${widget.driverDetails?['username'] ?? 'Driver'}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Profile Panel Widget
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  // Profile Photo Widget
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/avatar.png'),
                    // Replace with actual image path
                  ),
                  SizedBox(height: 16.0),
                  // Driver ID Text Widget
                  Text(
                    'Driver\'s ID: ${widget.driverDetails?['id'] ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // Details Text Widget
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username: ${widget.driverDetails?['name'] ?? 'N/A'}',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Phone No: ${widget.driverDetails?['phone'] ?? 'N/A'}',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Vehicle Model: ${widget.driverDetails?['vehicleModel'] ?? 'N/A'}',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'License Plate No: ${widget.driverDetails?['licensePlate'] ?? 'N/A'}',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Latitude: $latitude'),
                Text('Longitude: $longitude'),
                ElevatedButton(
                  onPressed: () {
                    getCurrentLocation();
                  },
                  child: Text("Grab Current Location"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PopupPage()),
                      // Replace PopupPage with your actual popup page
                    );
                  },
                  child: Text('Open Popup'),
                ),
                SizedBox(width: 10), // Add spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    var userData;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DriverLast()),
                      // Navigate to DriverLast page
                    );
                  },
                  child: Text('Last'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void updateAvailability(bool newValue) async {
    try {
      var driver = FirebaseAuth.instance.currentUser;
      if (driver != null) {
        // Get the driver's UID
        String driverId = driver.uid;
        debugPrint('Driver UID: $driverId');

        // Update the 'availability' field in the database
        await driverCollection.doc(driverId).update({'availability': newValue});
        debugPrint('Availability updated successfully.');

        // If availability is enabled, get FCM token and store it in Firestore
        if (newValue) {
          // Get FCM token
          String? fcmToken = await FirebaseMessaging.instance.getToken();
          debugPrint('FCM token: $fcmToken');

          // Update Firestore document with FCM token
          await driverCollection.doc(driverId).update({'OneSignalID': fcmToken});
          debugPrint('FCM token stored in Firestore.');
        }
      } else {
        debugPrint('No driver signed in.');
        print(newValue);
      }
    } catch (error) {
      debugPrint('Error updating availability: $error');
      // Show error message or handle error as needed
    }
  }


  void getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      log("loc denied");
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      try {
        Position currentposition = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        setState(()  {
          latitude = currentposition.latitude.toString(); // Update latitude value
          longitude = currentposition.longitude.toString();
        });


      }
      catch (error) {
        log("Error getting location: $error");
        // Handle location retrieval errors gracefully (e.g., show a toast)
      }
    }
  }

}