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
    apiKey: 'AIzaSyBJJSPdh-DET623kCt_Pkswexy7C_sDYOY',
    appId: '1:369228009103:web:64bf626a23be7a12caeafa',
    messagingSenderId: '369228009103',
    projectId: 'just-f3525',
    authDomain: 'just-f3525.firebaseapp.com',
    storageBucket: 'just-f3525.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJSXqvKG29WETa-8J44kXosA2gjjtu8vg',
    appId: '1:369228009103:android:697046f6115ce58acaeafa',
    messagingSenderId: '369228009103',
    projectId: 'just-f3525',
    storageBucket: 'just-f3525.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBy48cboRTaAK_rIKQyvfniMd2R4LZ1OnE',
    appId: '1:369228009103:ios:202d0b3c55d39ec5caeafa',
    messagingSenderId: '369228009103',
    projectId: 'just-f3525',
    storageBucket: 'just-f3525.appspot.com',
    iosClientId: '369228009103-17iktvfaj9jfnsvh0fs64sk4jqcdvs57.apps.googleusercontent.com',
    iosBundleId: 'com.example.just',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBy48cboRTaAK_rIKQyvfniMd2R4LZ1OnE',
    appId: '1:369228009103:ios:202d0b3c55d39ec5caeafa',
    messagingSenderId: '369228009103',
    projectId: 'just-f3525',
    storageBucket: 'just-f3525.appspot.com',
    iosClientId: '369228009103-17iktvfaj9jfnsvh0fs64sk4jqcdvs57.apps.googleusercontent.com',
    iosBundleId: 'com.example.just',
  );
}
