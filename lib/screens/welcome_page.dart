import 'package:flash_chat/utils/rouned_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    // Curved Animation
    // _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Tween Animation
    _animation = ColorTween(begin: Colors.blueGrey[700], end: Colors.white)
        .animate(_controller);
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _animation.value,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Image(
                      image: AssetImage('images/flash_logo.png'),
                      height: 65.0,
                    ),
                  ),
                  Text(
                    'Flash Chat',
                    style: TextStyle(fontSize: 45.0, color: Colors.black),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedButton(
                title: 'Login',
                backColor: Colors.blueAccent,
                onClick: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
              RoundedButton(
                title: 'Register',
                backColor: Colors.lightBlueAccent,
                onClick: () {
                  Navigator.pushNamed(context, '/register');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
