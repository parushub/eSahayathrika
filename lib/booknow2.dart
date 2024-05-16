// import 'package:geocoding/geocoding.dart';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:saha_new/confirmbook.dart';
//
//
// // Inside the _BookNowPage class
// Future<void> getCurrentLocation() async {
//   // Check location permission
//   LocationPermission permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied ||
//       permission == LocationPermission.deniedForever) {
//     // Request location permission if not granted
//     LocationPermission ask = await Geolocator.requestPermission();
//   } else {
//     try {
//       // Get current position
//       Position currentPosition = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.best);
//
//       // Update latitude and longitude
//       setState(() {
//         latitude = currentPosition.latitude.toString();
//         longitude = currentPosition.longitude.toString();
//       });
//
//       // Reverse geocoding to get address from coordinates
//       List<Placemark> placemarks =
//       await placemarkFromCoordinates(currentPosition.latitude, currentPosition.longitude);
//       if (placemarks != null && placemarks.isNotEmpty) {
//         Placemark currentPlacemark = placemarks[0];
//         setState(() {
//           locationName =
//           "${currentPlacemark.street}, ${currentPlacemark.locality}, ${currentPlacemark.postalCode}, ${currentPlacemark.country}";
//         });
//       }
//
//     } catch (error) {
//       log("Error getting location: $error");
//       // Handle location retrieval errors gracefully
//     }
//   }
// }
