import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:saha_new/signup.dart';
import 'package:saha_new/signup1.dart';
import 'package:saha_new/splash.dart';
//import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flutter/foundation.dart';
//import 'package:saha_new/firebase_options.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:const FirebaseOptions(
      apiKey: "AIzaSyCRLys2funjC4116U7w1sn9UczjoGnLnYQ",
      appId: "1:371918244245:android:6f349e6d6309f4b2ea8e9c",
      messagingSenderId: "371918244245",
      projectId: "esahanew",
    ),
  );

  //OneSignal.oneSignalAppId = "f03cfdb4-5ee5-46c6-8992-2c986f995066";
  // // Initialize OneSignal
  // OneSignal.shared.init.(setAppId("f03cfdb4-5ee5-46c6-8992-2c986f995066"));
  // OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  // OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedEvent event) {
  //   // Handle notification opened event
  // });

  // await OneSignal.shared.init(
  // appId: "f03cfdb4-5ee5-46c6-8992-2c986f995066",
  // // Other initialization options (if needed)
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}

