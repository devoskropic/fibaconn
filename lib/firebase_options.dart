// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDv_uT6ZDyUQPWvFzdVG6iYcfW82hQ7xKM',
    appId: '1:25999754613:web:bdb9b41b10ee8dbb0f7f3c',
    messagingSenderId: '25999754613',
    projectId: 'fibaconn',
    authDomain: 'fibaconn.firebaseapp.com',
    storageBucket: 'fibaconn.appspot.com',
    measurementId: 'G-EYG7VD6424',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwKsY_Q-ZksO802y0CwRxb-jkuE1tUzg8',
    appId: '1:25999754613:android:d982cc9b354820c70f7f3c',
    messagingSenderId: '25999754613',
    projectId: 'fibaconn',
    storageBucket: 'fibaconn.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAn7IY8LDTORFuOB6qs9LXCI29DxMI3VL0',
    appId: '1:25999754613:ios:d121ebde3e44b66f0f7f3c',
    messagingSenderId: '25999754613',
    projectId: 'fibaconn',
    storageBucket: 'fibaconn.appspot.com',
    iosBundleId: 'com.example.fibaconn',
  );
}
