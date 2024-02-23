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
    apiKey: 'AIzaSyBlNt9P7yaV05rCY_fjalep30Ugxafjp0I',
    appId: '1:466104468176:web:d611d4d3c4ba3e31bc94d5',
    messagingSenderId: '466104468176',
    projectId: 'my-finances-auth',
    authDomain: 'my-finances-auth.firebaseapp.com',
    storageBucket: 'my-finances-auth.appspot.com',
    measurementId: 'G-XK6DS2PY1R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBVWGUyn_4SpELmTx6vgH4GhbIChgL_2Oc',
    appId: '1:466104468176:android:218217be104ecf37bc94d5',
    messagingSenderId: '466104468176',
    projectId: 'my-finances-auth',
    storageBucket: 'my-finances-auth.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD3Xgz-DbmRhQu4c-KIjqXRJMi03lpdzSQ',
    appId: '1:466104468176:ios:1fa2741ffd251473bc94d5',
    messagingSenderId: '466104468176',
    projectId: 'my-finances-auth',
    storageBucket: 'my-finances-auth.appspot.com',
    iosBundleId: 'com.example.meFinances',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD3Xgz-DbmRhQu4c-KIjqXRJMi03lpdzSQ',
    appId: '1:466104468176:ios:e29ac0f912ad5c2abc94d5',
    messagingSenderId: '466104468176',
    projectId: 'my-finances-auth',
    storageBucket: 'my-finances-auth.appspot.com',
    iosBundleId: 'com.example.meFinances.RunnerTests',
  );
}
