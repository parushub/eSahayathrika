import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:firebase_database/firebase_database.dart'; // Firebase Database
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saha_new/loading.dart';
import 'confirmbook.dart'; // Assuming ConfirmBookPage is defined in confirmbook.dart

class BookNowPage extends StatefulWidget {
  final Map<String, dynamic> userData;

  BookNowPage({required this.userData});

  @override
  State<BookNowPage> createState() => _BookNowPage();
}

class _BookNowPage extends State<BookNowPage> {
  double? lat;
  double? long;
  //String address = "";

  TextEditingController dropoffController = TextEditingController();
  TextEditingController emergencyContactController = TextEditingController();

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getLatLong() {
    Future<Position> data = _determinePosition();
    data.then((value) {
      print("value $value");
      setState(() {
        lat = value.latitude;
        long = value.longitude;
      });

      //     getAddress(value.latitude, value.longitude);
      //   }).catchError((error) {
      //     print("Error $error");
      //   });
      // }
    });
  }

  // getAddress(lat, long) async {
  //   try {
  //     List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
  //     if (placemarks.isNotEmpty) {
  //       setState(() {
  //         // Use the name of the place instead of the street and country
  //         address = placemarks[0].name ?? 'Unknown place';
  //       });
  //     } else {
  //       setState(() {
  //         address = 'Unknown place';
  //       });
  //     }
  //   } catch (e) {
  //     print('Error getting place details: $e');
  //     setState(() {
  //       address = 'Unknown place';
  //     });
  //   }
  // }

  void addToDatabase() {
    DocumentReference rideReference = FirebaseFirestore.instance.collection('Ride').doc(); // Get a reference to a new document
    rideReference.set({
      'user': widget.userData['name'],
      'user_contact': widget.userData['contact'],
      'emergency_contact': emergencyContactController.text,
      'pick-up_latitude': lat,
      'pick-up_longitude': long,
      'dropoff': dropoffController.text,
    }).then((_) {
      print('Ride details added to Firestore');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoadingScreen(rideReference: rideReference)),
      );
    }).catchError((error) {
      print('Failed to add ride details: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Text(
              'BOOK YOUR JOURNEY',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Where do you want to go?',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(height: 20.0),
            Text(
              'Pick-up Location:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Latitude: $lat'),
            Text('Longitude: $long'),
            //Text('Address: $address'),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                getLatLong();
              },
              child: Text("Grab Current Location"),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: dropoffController,
              decoration: InputDecoration(
                labelText: 'Drop-off',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.map),
                  onPressed: () {},
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: emergencyContactController,
              decoration: InputDecoration(
                labelText: 'Emergency contact',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  addToDatabase(); // Add ride details to Firebase
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
