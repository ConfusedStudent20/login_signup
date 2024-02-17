import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterconnect/home_Screen.dart';
import 'package:flutterconnect/views/login_Screen.dart';
import 'package:flutterconnect/views/signup_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//for web
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBWWz45_Nvai_e_FX-VBptFyDl75uwFMjc",
            appId: "1:102538619753:web:cf164cb92cfbd2bb326bf8",
            messagingSenderId: "102538619753",
            projectId: "fir-connect-5b912",
            storageBucket: "fir-connect-5b912.appspot.com"));
  }
  //for android mobile

  else if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBWWz45_Nvai_e_FX-VBptFyDl75uwFMjc",
            appId: "1:102538619753:android:cf164cb92cfbd2bb326bf8",
            messagingSenderId: "102538619753",
            projectId: "fir-connect-5b912",
            storageBucket: "fir-connect-5b912.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: <String, WidgetBuilder>{
        '/loginScreen': (context) => const LoginScreen(),
        '/signupScreen': (context) => const SignupScreen(),
        '/homeScreen': (context) => const HomeScreen(),
      },
      home: const LoginScreen(),
    );
  }
}
