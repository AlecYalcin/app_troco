// docker: Firebase, Flutter, flutter_hooks: ^0.18.6, http: ^0.13.6, dart pub global activate flutterfire_cli
import 'firebase_options.dart';

// ...

await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);