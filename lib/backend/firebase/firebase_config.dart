import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDaRPswXJGNBS_VDbGemWaUeVF8vMdsCmQ",
            authDomain: "very-new-genai.firebaseapp.com",
            projectId: "very-new-genai",
            storageBucket: "very-new-genai.appspot.com",
            messagingSenderId: "542557904960",
            appId: "1:542557904960:web:c7bcf953adc7439ce5ffa5",
            measurementId: "G-PVQR8JMZNG"));
  } else {
    await Firebase.initializeApp();
  }
}
