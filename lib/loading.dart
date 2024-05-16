import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoadingScreen extends StatefulWidget {
  // final Map<String, dynamic> userData;
  //
  // LoadingScreen({required this.userData});
  final DocumentReference rideReference;

  LoadingScreen({required this.rideReference});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDrivers();
  }

  void fetchDrivers() {
    // Simulating fetching drivers, you can replace this with your actual logic
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void cancelRide() {
    // Cancel the latest ride entry
    widget.rideReference.delete().then((value) {
      print('Latest ride entry deleted');
    }).catchError((error) {
      print('Failed to delete ride entry: $error');
    });

    // Navigate back to the previous screen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
      ),
      body: Center(
        child: _isLoading
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Fetching Drivers for you...'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: cancelRide,
              child: Text('Cancel'),
            ),
          ],
        )
            : Text('Inserted data to Firestore database'),
      ),
    );
  }
}
