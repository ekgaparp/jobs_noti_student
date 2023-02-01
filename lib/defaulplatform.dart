import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (kIsWeb) {
      //Web
      Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAWCM-dyNkbsUk606QNyIzzmDn2S7ubsdw",
              authDomain: "jobs-noti-student-fd538.firebaseapp.com",
              projectId: "jobs-noti-student-fd538",
              storageBucket: "jobs-noti-student-fd538.appspot.com",
              messagingSenderId: "659999669595",
              appId: "1:659999669595:web:44e378e777a2b77f1aae7e",
              measurementId: "G-WN7ZDH1QF9"));
      return const FirebaseOptions(
          apiKey: "AIzaSyAWCM-dyNkbsUk606QNyIzzmDn2S7ubsdw",
          authDomain: "jobs-noti-student-fd538.firebaseapp.com",
          projectId: "jobs-noti-student-fd538",
          storageBucket: "jobs-noti-student-fd538.appspot.com",
          messagingSenderId: "659999669595",
          appId: "1:659999669595:web:44e378e777a2b77f1aae7e",
          measurementId: "G-WN7ZDH1QF9");
    } else {
      //Android
      return const FirebaseOptions(
        apiKey: "AIzaSyAWCM-dyNkbsUk606QNyIzzmDn2S7ubsdw",
        projectId: "jobs-noti-student-fd538",
        messagingSenderId: "659999669595",
        appId: "1:659999669595:android:d79308ef1fd5cd4d1aae7e",
      );
    }
  }
}
