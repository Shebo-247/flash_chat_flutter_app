import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/utils/menu_items.dart';
import 'package:flutter/material.dart';

Firestore _firestore = Firestore.instance;
FirebaseUser loggedUser;

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  FirebaseAuth _auth;

  List<MenuItems> items = [
    MenuItems(title: 'Sign Out'),
  ];

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedUser = user;
      } else {
        Navigator.pushNamed(context, '/welcome');
      }
    } catch (e) {
      print(e);
    }
  }

  void getAllUsers() async{
    await for(var snapshot in _firestore.collection('users').snapshots()){
      var users = snapshot.documents;
      for (var user in users){
        print(user.data);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _auth = FirebaseAuth.instance;
    getCurrentUser();

    getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flash Chat Page'),
        actions: <Widget>[
          PopupMenuButton<MenuItems>(
            onSelected: (value) {
              //print(value.title);
              if (value.title == 'Sign Out') {
                _auth.signOut();
                Navigator.pushNamed(context, '/welcome');
              }
            },
            itemBuilder: (BuildContext context) {
              return items.map((MenuItems item) {
                return PopupMenuItem<MenuItems>(
                  value: item,
                  child: Text(item.title),
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }
}
