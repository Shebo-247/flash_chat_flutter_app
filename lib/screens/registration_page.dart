import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_page.dart';
import 'package:flash_chat/utils/rouned_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:toast/toast.dart';

Firestore _firestore = Firestore.instance;

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  FirebaseAuth mAuth;

  String email, password;

  bool isShown = false;

  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _fullnameController;

  @override
  void initState() {
    super.initState();
    mAuth = FirebaseAuth.instance;

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _fullnameController = TextEditingController();
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
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: _fullnameController,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: kEditTextDecoration.copyWith(
                        hintText: 'Full Name'),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: _emailController,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: kEditTextDecoration.copyWith(
                        hintText: 'Email Address'),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    controller: _passwordController,
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    decoration:
                        kEditTextDecoration.copyWith(hintText: 'Password'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                RoundedButton(
                  title: 'Register',
                  backColor: Colors.lightBlueAccent,
                  onClick: () async{
                    setState(() {
                      isShown = true;
                    });
                    try{

                      if (_fullnameController.text == ''){
                        Toast.show("Provide fullname first !", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                        setState(() {
                          isShown = false;
                        });
                      }
                      else if(_emailController.text == ''){
                        Toast.show("Provide valid email address !", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                        setState(() {
                          isShown = false;
                        });
                      }
                      else if(_passwordController.text == ''){
                        Toast.show("Provide valid password !", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                        setState(() {
                          isShown = false;
                        });
                      }
                      else{
                        print(_fullnameController.value);
                        print(loggedUser.email);
                        final user = await mAuth.createUserWithEmailAndPassword(email: email, password: password);

                        _firestore.collection('users').add({'name' : _fullnameController.value, 'email': loggedUser.email});

                        if (user != null){
                          Navigator.pushNamed(context, '/user');
                        }

                        setState(() {
                          isShown = false;
                        });
                      }
                    }
                    catch(e){
                      print(e);
                      setState(() {
                        isShown = false;
                      });
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
