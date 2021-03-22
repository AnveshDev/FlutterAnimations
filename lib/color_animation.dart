import 'package:flutter/material.dart';

class ColorAnimation extends StatefulWidget {
  @override
  _ColorAnimationState createState() => _ColorAnimationState();
}

class _ColorAnimationState extends State<ColorAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    _animation = ColorTween(begin: Colors.red, end: Colors.blue).animate(_controller);
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
    Size _size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            height: _size.height,
            width: _size.width,
            color: _animation.value,
          ),
        ),
      ),
    );
  }
}
