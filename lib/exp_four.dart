import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ExpFourAnimations extends StatefulWidget {
  @override
  _ExpFourAnimationsState createState() => _ExpFourAnimationsState();
}

class _ExpFourAnimationsState extends State<ExpFourAnimations> with SingleTickerProviderStateMixin {

  Animation _containerRadiusAnimation,
      _containerSizeAnimation,
      _containerColorAnimation;
  AnimationController _containerAnimationController;

  @override
  void initState() {
    super.initState();
   // _containerAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 5000));
    _containerAnimationController=AnimationController(vsync: this,duration: Duration(milliseconds: 2000));
    _containerRadiusAnimation = BorderRadiusTween(
        begin: BorderRadius.circular(50.0),
        end: BorderRadius.circular(0.0))
        .animate(CurvedAnimation(
        curve: Curves.ease, parent: _containerAnimationController));

    _containerSizeAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            curve: Curves.ease, parent: _containerAnimationController));

    _containerColorAnimation =
        ColorTween(begin: Colors.black, end: Colors.white).animate(
            CurvedAnimation(
                curve: Curves.ease, parent: _containerAnimationController));

  }

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(body: Container(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                _containerAnimationController.isCompleted?_containerAnimationController.reverse():_containerAnimationController.forward();
              },
              child: Text('CLICK'),
            ),
            AnimatedBuilder(
              animation: _containerAnimationController,
              builder: (context, index) {
                return Container(
                  width: _containerSizeAnimation.value * height,
                  height: _containerSizeAnimation.value *width,
                  decoration: BoxDecoration(
                      borderRadius: _containerRadiusAnimation.value,
                      color: _containerColorAnimation.value),
                );
              },
            ),
          ],
        ),
      ),),
    );
  }
}
