import 'package:flutter/material.dart';
import 'package:flutter_app/color_animation.dart';
import 'package:flutter_app/provider_example.dart';
import 'package:flutter_app/text_style_animation.dart';
import 'package:flutter_app/third_party.dart';
import 'package:flutter_app/web_site_one.dart';

import 'dynamic_data_screen.dart';
import 'exp_four.dart';
import 'exp_one.dart';
import 'exp_three.dart';
import 'exp_two.dart';
import 'listviewpositions.dart';
import 'transform_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

  }
  @override
  void dispose() {
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
       body: Container(
         padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
         child: ListView(
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                    return  TransformAnimation();
                   }));
                 }, child: Text('Transform')),
                 ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                    return  ColorAnimation();
                   }));
                 }, child: Text('Color Animation')),
                 ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                    return  TextStyleAnimation();
                   }));
                 }, child: Text('TextStyle Animation')),
                 ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                    return  ExpOneAnimation();
                   }));
                 }, child: Text('Experiment Animation')),
                 ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                    return  ExpTwoAnimation();
                   }));
                 }, child: Text('Experiment Two Animation')),
                 ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                    return  ExpThreeAnimation();
                   }));
                 }, child: Text('Experiment Three Animation')),
                 ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                    return  ExpFourAnimations();
                   }));
                 }, child: Text('Experiment Four Animation')),
                 ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                    return  SwipeAnimation();
                   }));
                 }, child: Text('Swipe Animation')),
                 ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                    return  ScrollablePositionedListPage();
                   }));
                 }, child: Text('Dynamic data')),
                 ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                     return  MainMultiProvider();
                   }));
                 }, child: Text('Provider Basic')),
                 ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                     return  WebSiteOneScreen();
                   }));
                 }, child: Text('WebOne')),
               ],
             ),
           ],
         ),
       ),
     ),
   );
  }
}
