import 'package:flutter/material.dart';

class ExpOneAnimation extends StatefulWidget {
  @override
  _ExpOneAnimationState createState() => _ExpOneAnimationState();
}

class _ExpOneAnimationState extends State<ExpOneAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    _animation = Tween<double>(begin: 0, end: 300).animate(_controller);
    _animation.addListener(() {
      setState(() {
      });
    });
    /*_animation.addStatusListener((status) {
      if(status ==AnimationStatus.completed){
        _controller.repeat();
      }
    });*/
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height:_animation.value,
                width: _animation.value,
                color: Colors.blue,
              ),
              ElevatedButton(onPressed: (){
                _controller.isCompleted? _controller.reverse():_controller.forward();
              }, child: Text('Animate Button'))
            ],
          ),
        ),
      ),
    );
  }
}
