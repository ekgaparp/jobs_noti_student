import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    if (kIsWeb) {
      //Web
      Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyDlQ4czHYLID5v3VqpuAH-v-2CSRmzDf10",
              authDomain: "jobs-noti-student.firebaseapp.com",
              projectId: "jobs-noti-student",
              storageBucket: "jobs-noti-student.appspot.com",
              messagingSenderId: "318132939256",
              appId: "1:318132939256:web:480d73c5bc2389f9504e0d",
              measurementId: "G-Z7VTTSHP0Q"));
      return const FirebaseOptions(
          apiKey: "AIzaSyDlQ4czHYLID5v3VqpuAH-v-2CSRmzDf10",
          authDomain: "jobs-noti-student.firebaseapp.com",
          projectId: "jobs-noti-student",
          storageBucket: "jobs-noti-student.appspot.com",
          messagingSenderId: "318132939256",
          appId: "1:318132939256:web:480d73c5bc2389f9504e0d",
          measurementId: "G-Z7VTTSHP0Q");
    } else {
      //Android
      return const FirebaseOptions(
        apiKey: "AIzaSyDlQ4czHYLID5v3VqpuAH",
        projectId: "jobs-noti-student",
        messagingSenderId: "318132939256",
        appId: "1:318132939256:android:448eca0e8ab54937504e0d",
      );
    }
  }
}
