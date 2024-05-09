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
    apiKey: 'AIzaSyD-Ku0UHeTd1SZjVdbCVHmJXvems1n0JpQ',
    appId: '1:712079687075:web:52052dc37c55d429dbae16',
    messagingSenderId: '712079687075',
    projectId: 'voyage-e0e00',
    authDomain: 'voyage-e0e00.firebaseapp.com',
    storageBucket: 'voyage-e0e00.appspot.com',
    measurementId: 'G-F9QEX7CM15',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8kdyQFaASZ2YQThioSYnJiH2HUlgk6dk',
    appId: '1:712079687075:android:5fcf67f23f70b80fdbae16',
    messagingSenderId: '712079687075',
    projectId: 'voyage-e0e00',
    storageBucket: 'voyage-e0e00.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAMufY0dU4OA8SVVjlk_QYcJ_ZzZ_0ysbM',
    appId: '1:712079687075:ios:70a620bcf8b19c08dbae16',
    messagingSenderId: '712079687075',
    projectId: 'voyage-e0e00',
    storageBucket: 'voyage-e0e00.appspot.com',
    iosBundleId: 'com.example.voyage',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAMufY0dU4OA8SVVjlk_QYcJ_ZzZ_0ysbM',
    appId: '1:712079687075:ios:15725727a6b23d40dbae16',
    messagingSenderId: '712079687075',
    projectId: 'voyage-e0e00',
    storageBucket: 'voyage-e0e00.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD-Ku0UHeTd1SZjVdbCVHmJXvems1n0JpQ',
    appId: '1:712079687075:web:3f77dcc5179d421fdbae16',
    messagingSenderId: '712079687075',
    projectId: 'voyage-e0e00',
    authDomain: 'voyage-e0e00.firebaseapp.com',
    storageBucket: 'voyage-e0e00.appspot.com',
    measurementId: 'G-3S32H5MYMT',
  );
}
