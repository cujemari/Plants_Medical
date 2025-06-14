// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAo6PMCCQWkl6f_9FAj6gW5uM6stLW_ghY',
    appId: '1:64196211276:web:ea2654c9a40e4f8b1afae9',
    messagingSenderId: '64196211276',
    projectId: 'plantas-medicinales-74c07',
    authDomain: 'plantas-medicinales-74c07.firebaseapp.com',
    databaseURL: 'https://plantas-medicinales-74c07-default-rtdb.firebaseio.com',
    storageBucket: 'plantas-medicinales-74c07.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDiaXFAyI2K8oRZA4z8p-vDGEh2HnrDSFw',
    appId: '1:64196211276:android:4714e290c5f5460a1afae9',
    messagingSenderId: '64196211276',
    projectId: 'plantas-medicinales-74c07',
    databaseURL: 'https://plantas-medicinales-74c07-default-rtdb.firebaseio.com',
    storageBucket: 'plantas-medicinales-74c07.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFsnbF7E-nDNf9nmUHQ_b14D1fTLP7fVk',
    appId: '1:64196211276:ios:7c548866a71d3bac1afae9',
    messagingSenderId: '64196211276',
    projectId: 'plantas-medicinales-74c07',
    databaseURL: 'https://plantas-medicinales-74c07-default-rtdb.firebaseio.com',
    storageBucket: 'plantas-medicinales-74c07.firebasestorage.app',
    androidClientId: '64196211276-27clvq41b7n69041mvj022p3dk4p2qlh.apps.googleusercontent.com',
    iosClientId: '64196211276-nvk8aggsft7nqn4g0ookp1l7busa67j4.apps.googleusercontent.com',
    iosBundleId: 'com.example.appPlants',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDFsnbF7E-nDNf9nmUHQ_b14D1fTLP7fVk',
    appId: '1:64196211276:ios:7c548866a71d3bac1afae9',
    messagingSenderId: '64196211276',
    projectId: 'plantas-medicinales-74c07',
    databaseURL: 'https://plantas-medicinales-74c07-default-rtdb.firebaseio.com',
    storageBucket: 'plantas-medicinales-74c07.firebasestorage.app',
    androidClientId: '64196211276-27clvq41b7n69041mvj022p3dk4p2qlh.apps.googleusercontent.com',
    iosClientId: '64196211276-nvk8aggsft7nqn4g0ookp1l7busa67j4.apps.googleusercontent.com',
    iosBundleId: 'com.example.appPlants',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAo6PMCCQWkl6f_9FAj6gW5uM6stLW_ghY',
    appId: '1:64196211276:web:23e60fcd1cf18dfd1afae9',
    messagingSenderId: '64196211276',
    projectId: 'plantas-medicinales-74c07',
    authDomain: 'plantas-medicinales-74c07.firebaseapp.com',
    databaseURL: 'https://plantas-medicinales-74c07-default-rtdb.firebaseio.com',
    storageBucket: 'plantas-medicinales-74c07.firebasestorage.app',
  );

}