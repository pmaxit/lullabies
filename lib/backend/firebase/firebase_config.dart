import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAh2PNfH7fi1RyBAwdFPxulVD0nEVHrLRM",
            authDomain: "fir-flutterflow-f5e2f.firebaseapp.com",
            projectId: "fir-flutterflow-f5e2f",
            storageBucket: "fir-flutterflow-f5e2f.appspot.com",
            messagingSenderId: "89989267242",
            appId: "1:89989267242:web:6a6b39c9bc0e2e74736853",
            measurementId: "G-4T52ZZB49D"));
  } else {
    await Firebase.initializeApp();
  }
}
