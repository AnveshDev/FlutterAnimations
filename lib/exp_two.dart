import 'package:flutter/material.dart';


class ExpTwoAnimation extends StatefulWidget {
  @override
  _ExpTwoAnimationState createState() => _ExpTwoAnimationState();
}

class _ExpTwoAnimationState extends State<ExpTwoAnimation> with SingleTickerProviderStateMixin{
  final elevation = 3.0;
  AnimationController _controller;
  Animation<Color> _animation,_animation_blur1,_animation_blur2;

  @override
  void initState() {
    super.initState();

    _controller=AnimationController(vsync: this,duration: Duration(milliseconds: 6000));

    _animation=ColorTween(
      begin: Colors.deepOrangeAccent,
      end: Colors.grey.shade50
    ).animate(_controller);
    _animation.addListener(() {
      setState(() {

      });
    });


    _animation_blur1=ColorTween(
        begin: Colors.deepOrangeAccent,
        end: Colors.grey.shade300
    ).animate(_controller);
    _animation_blur1.addListener(() {
      setState(() {

      });
    });
    _animation_blur2=ColorTween(
        begin: Colors.yellow,
        end: Colors.white
    ).animate(_controller);
    _animation_blur2.addListener(() {
      setState(() {

      });
    });
    _controller.forward();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Text('Hello',style: TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.bold,
            color: _animation.value,
              shadows: [
                Shadow(
                    color: _animation_blur1.value,
                    offset: Offset(3.0, 3.0),
                    blurRadius: elevation),
                Shadow(
                    color: _animation_blur2.value,
                    offset: Offset(-3.0, 3.0),
                    blurRadius: elevation),
              ],
          ),),
        ),
      ),
    );
  }
}
