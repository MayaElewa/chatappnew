//import 'dart:collection'; unused import

import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/pages/chatpage.dart';
import 'package:chatapp/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:chatapp/pages/register_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Scholarchat());
}

class Scholarchat extends StatelessWidget {
  const Scholarchat({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        chatpage.id: (context) => chatpage(),
      },
      initialRoute: LoginPage.id, // ✅ Match the route key in the map

      //home: RegisterPage(),
      //home: LoginPage(),
    );
  }
}
