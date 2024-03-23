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
        return macos;
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
    apiKey: 'AIzaSyB_V_UKW2aA1pDVnvA2tWa03UV0LClRpvo',
    appId: '1:687983679377:web:0843d9e0d49ffab0fcac30',
    messagingSenderId: '687983679377',
    projectId: 'auth-admin-94122',
    authDomain: 'auth-admin-94122.firebaseapp.com',
    storageBucket: 'auth-admin-94122.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA9xgQm1U0pYyY2Bu0id4hyD4hqUZsAHPA',
    appId: '1:687983679377:android:08c778dd13d3c75cfcac30',
    messagingSenderId: '687983679377',
    projectId: 'auth-admin-94122',
    storageBucket: 'auth-admin-94122.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6zZ-VCUfX9lYpEXn0X1Du_m-iw_UhWmo',
    appId: '1:687983679377:ios:58d46ae6694956ccfcac30',
    messagingSenderId: '687983679377',
    projectId: 'auth-admin-94122',
    storageBucket: 'auth-admin-94122.appspot.com',
    iosClientId: '687983679377-amj6o0ooa47al0tqogcfi0k52hjov3s8.apps.googleusercontent.com',
    iosBundleId: 'com.example.zawLinHtikeApAssignment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6zZ-VCUfX9lYpEXn0X1Du_m-iw_UhWmo',
    appId: '1:687983679377:ios:58d46ae6694956ccfcac30',
    messagingSenderId: '687983679377',
    projectId: 'auth-admin-94122',
    storageBucket: 'auth-admin-94122.appspot.com',
    iosClientId: '687983679377-amj6o0ooa47al0tqogcfi0k52hjov3s8.apps.googleusercontent.com',
    iosBundleId: 'com.example.zawLinHtikeApAssignment',
  );
}
