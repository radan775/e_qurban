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
    apiKey: 'AIzaSyC_TzRsiQ8AfpRrEqQ0sRSIQxGHCTCm4uw',
    appId: '1:512598677574:web:2dc049a00368274fb49247',
    messagingSenderId: '512598677574',
    projectId: 'flutter-cc7a2',
    authDomain: 'flutter-cc7a2.firebaseapp.com',
    storageBucket: 'flutter-cc7a2.appspot.com',
    measurementId: 'G-23V0FBD6PZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBL-HbqCPPjXiUcSLDputzxI_NkF3Yg-vI',
    appId: '1:512598677574:android:be85e94c97a9753bb49247',
    messagingSenderId: '512598677574',
    projectId: 'flutter-cc7a2',
    storageBucket: 'flutter-cc7a2.appspot.com',
  //   apiKey: 'AIzaSyAc3tLou0lMyLiYhD_pcbjMDcPLtP6-tJ8', //topek
  //   appId: '1:74696540904:web:cd5119122b0a8dda333f5d',
  //   messagingSenderId: '74696540904',
  //   projectId: 'e-qurban-3a2c9',
  //   authDomain: 'e-qurban-3a2c9.firebaseapp.com',
  //   storageBucket: 'e-qurban-3a2c9.appspot.com',
  // );

  // static const FirebaseOptions android = FirebaseOptions(
  //   apiKey: 'AIzaSyCxUDlE15A-yhLw1pCKwcGbPIBfWop2VZU',
  //   appId: '1:74696540904:android:660161d96d510862333f5d',
  //   messagingSenderId: '74696540904',
  //   projectId: 'e-qurban-3a2c9',
  //   storageBucket: 'e-qurban-3a2c9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4cYlnAmEUBaraUk15t1cgxcdFxroF1B8',
    appId: '1:74696540904:ios:f94a53c2f0c7fcc8333f5d',
    messagingSenderId: '74696540904',
    projectId: 'e-qurban-3a2c9',
    storageBucket: 'e-qurban-3a2c9.appspot.com',
    iosBundleId: 'com.example.eQurban',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4cYlnAmEUBaraUk15t1cgxcdFxroF1B8',
    appId: '1:74696540904:ios:f94a53c2f0c7fcc8333f5d',
    messagingSenderId: '74696540904',
    projectId: 'e-qurban-3a2c9',
    storageBucket: 'e-qurban-3a2c9.appspot.com',
    iosBundleId: 'com.example.eQurban',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC_TzRsiQ8AfpRrEqQ0sRSIQxGHCTCm4uw',
    appId: '1:512598677574:web:807cab24e7e9f71eb49247',
    messagingSenderId: '512598677574',
    projectId: 'flutter-cc7a2',
    authDomain: 'flutter-cc7a2.firebaseapp.com',
    storageBucket: 'flutter-cc7a2.appspot.com',
    measurementId: 'G-9MJ0TCLV5H',
    
    // apiKey: 'AIzaSyAc3tLou0lMyLiYhD_pcbjMDcPLtP6-tJ8',
    // appId: '1:74696540904:web:c8c425248dfda1df333f5d', //topek
    // messagingSenderId: '74696540904',
    // projectId: 'e-qurban-3a2c9',
    // authDomain: 'e-qurban-3a2c9.firebaseapp.com',
    // storageBucket: 'e-qurban-3a2c9.appspot.com',
  );

}