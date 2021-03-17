import 'package:flutter/material.dart';

class TextStyleAnimation extends StatefulWidget {
  @override
  _TextStyleAnimationState createState() => _TextStyleAnimationState();
}

class _TextStyleAnimationState extends State<TextStyleAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<TextStyle> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    _animation = TextStyleTween(begin: TextStyle(
      color: Colors.green,
      fontSize: 80,
      fontWeight: FontWeight.w600
    ), end: TextStyle(
        color: Colors.deepOrange,
        fontSize: 20,
        fontWeight: FontWeight.w800
    )).animate(_controller);
    _animation.addListener(() {
      setState(() {
      });
    });
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
           child: Text('Welcome to Naapelli.com',style: _animation.value,),

          ),
        ),
      ),
    );
  }
}
