const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const admin = require('firebase-admin');

// Middleware to parse JSON request bodies
app.use(bodyParser.json());

// Initialize Firebase Admin SDK
const serviceAccount = require('D:\Sample'); // Replace with your service account key file
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: 'https://console.firebase.google.com/u/2/project/esahanew/firestore/databases/-default-/data/~2F' // Replace with your Firebase database URL
});

// Signup endpoint
app.post('/signup', async (req, res) => {
  try {
    // Extract email and password from request body
    const { email, password } = req.body;

    // Implement signup logic
    // For example, create user in Firebase Auth
    const userRecord = await admin.auth().createUser({
      email: email,
      password: password
    });

    // Store user signup information in Firestore
    await admin.firestore().collection('users').doc(userRecord.uid).set({
      email: email,
      // Add more fields if needed
    });

    // Respond with success message
    res.status(200).json({ message: 'Signup successful' });
  } catch (error) {
    console.error('Error signing up:', error);
    res.status(500).json({ message: 'Signup failed' });
  }
});

// Start the server
const PORT = process.env.PORT || 30
00;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
