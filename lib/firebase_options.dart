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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBcsDAajVRAd3BY4IDUbvSPz-YSARQxmeE',
    appId: '1:879820098286:android:d29a59322c7e6d61e381ff',
    messagingSenderId: '879820098286',
    projectId: 'fine-mobile-21acd',
    storageBucket: 'fine-mobile-21acd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2uGaWPI-MiCCx1EOMXVo3C_jFy0qIkoc',
    appId: '1:879820098286:ios:437f509dc66e71f8e381ff',
    messagingSenderId: '879820098286',
    projectId: 'fine-mobile-21acd',
    storageBucket: 'fine-mobile-21acd.appspot.com',
    androidClientId:
        '879820098286-6hfsh59lifspljpcvcuhgdor8itrq7qb.apps.googleusercontent.com',
    iosClientId:
        '879820098286-nom1urm7rmjv4lopbckj0misk5pa0i59.apps.googleusercontent.com',
    iosBundleId: 'com.smjle.fineMobile',
  );
}
