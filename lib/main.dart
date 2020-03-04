import 'package:flash_chat/screens/chat_page.dart';
import 'package:flash_chat/screens/login_page.dart';
import 'package:flash_chat/screens/registration_page.dart';
import 'package:flash_chat/screens/splash_page.dart';
import 'package:flash_chat/screens/user_page.dart';
import 'package:flash_chat/screens/welcome_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => SplashPage(),
        '/welcome' : (context) => WelcomePage(),
        '/register' : (context) => RegistrationPage(),
        '/login' : (context) => LoginPage(),
        '/user' : (context) => UserPage(),
        '/chat' : (context) => ChatPage(),
      },
    );
  }
}