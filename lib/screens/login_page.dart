import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/utils/rouned_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  FirebaseAuth _auth;

  String email, password;

  bool isShown = false;

  @override
  void initState() {
    super.initState();

    _auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isShown,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image(
                      image: AssetImage('images/flash_logo.png'),
                      height: 200.0,
                      width: 200.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: kEditTextDecoration.copyWith(
                        hintText: 'Email or Username'),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    decoration: kEditTextDecoration.copyWith(
                        hintText: 'Password'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                RoundedButton(
                  title: 'Login',
                  backColor: Colors.blueAccent,
                  onClick: () async {
                    setState(() {
                      setState(() {
                        isShown = true;
                      });
                    });
                    try{
                      final result = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
                      if (result != null){
                        Navigator.pushNamed(context, '/user');
                      }
                      setState(() {
                        isShown = false;
                      });
                    } catch(e){
                      print(e);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

