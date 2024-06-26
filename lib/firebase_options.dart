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
    apiKey: 'AIzaSyAOV364AZ6EwVs67uiAN-zYJ34qmmakp_s',
    appId: '1:264917011665:web:6796913ffa0ec9f50949f0',
    messagingSenderId: '264917011665',
    projectId: 'chatapp-35d7f',
    authDomain: 'chatapp-35d7f.firebaseapp.com',
    storageBucket: 'chatapp-35d7f.appspot.com',
    measurementId: 'G-9RPTEZ0LBJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIR4uqXieX9eMEfZ5vp96TOLnu5woz2Iw',
    appId: '1:264917011665:android:108fcfe13495afba0949f0',
    messagingSenderId: '264917011665',
    projectId: 'chatapp-35d7f',
    storageBucket: 'chatapp-35d7f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAP05El1AvJirX-DbUPF-zoDcNrzF7lQfQ',
    appId: '1:264917011665:ios:4d37eb69a221219b0949f0',
    messagingSenderId: '264917011665',
    projectId: 'chatapp-35d7f',
    storageBucket: 'chatapp-35d7f.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );
}
