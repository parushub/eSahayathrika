import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:saha_new/home.dart'; // Import your home page
import 'package:saha_new/signup.dart'; // Import your signup page
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saha_new/signup1.dart'; // Import Cloud Firestore

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _handleLogin(BuildContext context) async {
    try {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      // Check if email and password are not empty
      if (email.isNotEmpty && password.isNotEmpty) {
        // Sign in with email and password
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Fetch additional user data from Firestore
        DocumentSnapshot userDataSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();

        Map<String, dynamic> userData = userDataSnapshot.data() as Map<String, dynamic>;

        // Navigate to home page with user data
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(userData: userData),
          ),
        );
        checkUserSignIn();
      } else {
        // Show snackbar if email or password is empty
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter email and password')),
        );
      }
    } catch (e) {
      // Show snackbar with error message if login fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable back arrow
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context); // Go back to previous screen
        //   },
        // ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff260e69),
                ),
                child: Icon(
                  Icons.account_circle,
                  size: 100.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30.0),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _handleLogin(context); // Handle login
                  },
                  child: Text('Login'),
                ),
              ),
              SizedBox(height: 10.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Text('New User? Create an account!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void checkUserSignIn() {
  var user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    // User is signed in
    print('User is signed in.');
  } else {
    // No user is signed in
    print('No user is signed in.');
  }
}