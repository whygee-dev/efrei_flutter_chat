import 'package:efrei_flutter_chat/constants.dart';
import 'package:efrei_flutter_chat/pages/chat.dart';
import 'package:efrei_flutter_chat/pages/login.dart';
import 'package:efrei_flutter_chat/pages/signup.dart';
import 'package:flutter/material.dart';
import 'pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

var colorScheme = null;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  colorScheme = await ColorScheme.fromImageProvider(
    provider: AssetImage(
      'assets/images/efrei.png',
    ),
    primary: mainColor,
  );

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Efrei Chat',
      theme: ThemeData(
        colorScheme: colorScheme,
        textTheme: TextTheme(
          bodySmall: TextStyle(fontFamily: 'Poppins', color: mainColor),
          bodyLarge: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
        '/chat': (context) => Chat(),
      },
    );
  }
}
