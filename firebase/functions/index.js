const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();
const db = admin.firestore();

// Create and Deploy Your First Cloud Functions
// https://firebase.google.com/docs/functions/write-firebase-functions

exports.helloWorld = functions.https.onRequest((request, response) => {
  functions.logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from Firebase!");
});

exports.createUser = functions.auth.user().onCreate((user) => {
  const name = user.displayName;
  const uid = user.uid;
  const email = user.email;
  db.collection("userData").doc(uid).set({
    uid: uid,
    name: name,
    email: email,
  }).then((doc) => {
    console.log("new user created with uid : ", uid + " name : ", name);
  }).catch((error) => {
    console.error("error while creating new user " + error);
  });
});
