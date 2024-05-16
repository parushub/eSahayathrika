// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:saha_new/confirmbook.dart';
//
//
// class BookNowPage extends StatefulWidget {
//   final Map<String, dynamic> userData; // Define userData as a parameter
//
//   BookNowPage({required this.userData}); // Constructor to receive userData
//
//   //const BookNowPage({Key? key}) : super(key: key);
//
//   @override
//   State<BookNowPage> createState() => _BookNowPage();
// }
//
// class _BookNowPage extends State<BookNowPage> {
//
//
//   double? lat;
//
//   double? long;
//
//   String address = "";
//
//
//
//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       return Future.error('Location services are disabled.');
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.
//         return Future.error('Location permissions are denied');
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//
//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     return await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//   }
//
//
//
//   getLatLong() {
//     Future<Position> data = _determinePosition();
//     data.then((value) {
//       print("value $value");
//       setState(() {
//         lat = value.latitude;
//         long = value.longitude;
//       });
//
//       getAddress(value.latitude, value.longitude);
//     }).catchError((error) {
//       print("Error $error");
//     });
//   }
//
// //For convert lat long to address
//   getAddress(lat, long) async {
//     List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
//     setState(() {
//       address = placemarks[0].street! + " " + placemarks[0].country!;
//     });
//
//     for (int i = 0; i < placemarks.length; i++) {
//       print("INDEX $i ${placemarks[i]}");
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 20.0),
//             Text(
//               'BOOK YOUR JOURNEY',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10.0),
//             Text(
//               'Where do you want to go?',
//               style: TextStyle(
//                 fontSize: 18.0,
//               ),
//             ),
//             SizedBox(height: 20.0),
//
//
//             SizedBox(height: 20.0),
//             // Display pickup location details
//             Text(
//               'Pick-up Location:',
//               style: TextStyle(
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             //Text('Address: $pickupAddress'),
//             Text('Latitude: $lat'),
//             Text('Longitude: $long'),
//             Text('Address: $address'), // Display the address
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 getLatLong();
//               },
//               child: Text("Grab Current Location"),
//             ),
//             SizedBox(height: 10.0),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Drop-off',
//                 border: OutlineInputBorder(),
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.map),
//                   onPressed: () {
//                     // Handle map icon pressed for drop-off field
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: 10.0),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Emergency contact',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => ConfirmBookPage(userData: widget.userData)),
//                   );
//                 },
//                 child: Text('Confirm'),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }