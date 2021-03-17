import 'package:flutter/material.dart';

class TransformAnimation extends StatefulWidget {
  @override
  _TransformAnimationState createState() => _TransformAnimationState();
}

class _TransformAnimationState extends State<TransformAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    _animation = Tween<double>(begin: 0.0, end: 100.0).animate(_controller);
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
          child: Transform.translate(
            offset: Offset(0, _animation.value),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
