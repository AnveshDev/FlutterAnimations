import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ExpThreeAnimation extends StatefulWidget {
  @override
  _ExpThreeAnimationState createState() => _ExpThreeAnimationState();
}

class _ExpThreeAnimationState extends State<ExpThreeAnimation> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation<BorderRadius> _animation;
  Animation<Color> _animation_color;

  bool status=false;

  @override
  void initState() {
    super.initState();

    _animationController=AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    _animation=BorderRadiusTween(
      begin: BorderRadius.circular(10),
      end: BorderRadius.circular(100)
    ).animate(_animationController);

    _animation.addListener(() {
      setState(() {
      });
    });

    _animation_color=ColorTween(
      begin: Colors.red,
      end: Colors.green
    ).animate(_animationController);

    _animation_color.addListener(() {
      setState(() {
      });
    });


    //_animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: _animation_color.value,
                borderRadius: _animation.value,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  status?Text('INDO',style: TextStyle(color: Colors.white,fontSize: 40),):CircularProgressIndicator()

                ],
              ),
            ),
            onTap: (){
             // if(status)
              if(_animationController.isCompleted){
                _animationController.reverse();
                status=true;
              }else{
                _animationController.forward();
                status=false;
              }
            },
          ),
        ),
      ),
    );
  }
}
