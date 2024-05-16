var admin = require("firebase-admin");

var serviceAccount = require("path/to/serviceAccountKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://esahanew-default-rtdb.firebaseio.com"
});

// Get a reference to the "driver" collection
const db = admin.firestore();
const driverCollection = db.collection("drivers");

// Fetch all the documents from "driver" collection
driverCollection.get()
  .then((querySnapshot) => {
    querySnapshot.forEach((doc) => {
      // Retrieve each document data
      const driverData = doc.data();
      console.log(driverData);
    });
  })
  .catch((error) => {
    console.log("Error getting documents: ", error);
  });