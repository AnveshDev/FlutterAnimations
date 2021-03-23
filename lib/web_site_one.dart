import 'dart:convert';
import 'dart:math' as math;


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/search_profiles_model.dart';
import 'package:http/http.dart' as http;

class WebSiteOneScreen extends StatefulWidget {
  @override
  _WebSiteOneScreenState createState() => _WebSiteOneScreenState();
}

class _WebSiteOneScreenState extends State<WebSiteOneScreen>
    with SingleTickerProviderStateMixin {
  List<String> _menu_data = [
    'Home',
    'About',
    'Contact Us',
    'Products',
    'Vision'
  ];
  var _select_index = 0;

  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSearchDetails();

    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 6000));
    _animation = Tween<double>(begin: 0, end: 30).animate(_animationController);
    _animation.addListener(() {
      setState(() {
      });
    });
    _animationController.forward();

  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _animationController.dispose();
  }
  var _select_mf = '';
  bool selected = false;
  ScrollController _controller = new ScrollController();

  void _goToElement(int index){
    _controller.animateTo((100.0 * index), // 100 is the height of container and index of 6th element is 5
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOut);
  }

  List<SearchProfilesModel> _search_data=[];
  bool _loading=false;

  //HTTP REQ
  Map<String, String> get headers => {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*"
  };
  Future<List<SearchProfilesModel>> _getSearchDetails() async {
    setState(() {
      _loading=true;
    });

    var response = await http.get('http://192.168.108.31:91/user/GeneralSearchgender=f&age_from=20&age_to=25&religion=2',headers: headers );
    if (response.statusCode == 200) {
      var myJson = json.decode(response.body);
      Iterable list = myJson;
      print('States_list: ${jsonDecode(response.body)}');
      setState(() {
        _search_data.clear();
        for (Map k in list) {
          _search_data.add(SearchProfilesModel(
              userId: SearchProfilesModel.fromJson(k).userId,
              qualiName: SearchProfilesModel.fromJson(k).qualiName,
              age: SearchProfilesModel.fromJson(k).age,
              height: SearchProfilesModel.fromJson(k).height,
              profilePic: SearchProfilesModel.fromJson(k).profilePic));
        }
        _loading=false;
      });

     // print('_search_data$_search_data');
      return list.map((model) => SearchProfilesModel.fromJson(model)).toList();
    } else {
      throw 'Designations Exception';
    }
  }

  @override
  Widget build(BuildContext context) {
    var height_screen = MediaQuery
        .of(context)
        .size
        .height;
    var width_screen = MediaQuery
        .of(context)
        .size
        .width;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              title: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    /*Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Matrimony',
                            style: GoogleFonts.aBeeZee(
                              textStyle: TextStyle(
                                color: Colors.blueGrey,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                                *//*shadows: [
                                  Shadow(
                                      color: Colors.white,
                                      offset: Offset(3.0, 3.0),
                                      blurRadius: 0.1),
                                  Shadow(
                                      color: Colors.blueGrey,
                                      offset: Offset(-3.0, 3.0),
                                      blurRadius: 0.1),
                                ]*//*
                              ),
                            )),
                        *//*Text(
                          '.com',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),*//*
                      ],
                    ),*/
                    Text('Matrimony',
                        style: GoogleFonts.aBeeZee(
                          textStyle: TextStyle(
                            color: Colors.blueGrey,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                          ),
                        )),
                    Transform.rotate(
                      angle: math.pi / _animation.value,
                      child: Text('.com', style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14)),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Text(
                        'Services',
                        style: GoogleFonts.laila(
                            textStyle: TextStyle(
                                color: Colors.black,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w400,
                                fontSize: 15)),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: (){
                        _goToElement(10);
                      },
                      child: Text(
                        'Search',
                        style: GoogleFonts.laila(
                            textStyle: TextStyle(
                                color: Colors.black,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w400,
                                fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              controller: _controller,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    /* Container(height: width_screen > 600 ?60:200,
                      child: ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: width_screen > 600 ? Axis.horizontal : Axis.vertical,
      itemCount: _menu_data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
                      onTap: () {
                        setState(() {});
                        _select_index = index;
                      },
                      child: Container(
                      height: 30,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color:
                              _select_index == index ? Colors.blueGrey : Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        _menu_data[index],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: _select_index == index
                                ? Colors.white
                                : Colors.blueGrey,
                            letterSpacing: _select_index == index
                                ? -1
                                : 1),
                      )));
      },
    ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {

                        });
                        selected=!selected;
                      },
                      child: AnimatedContainer(
                        width: selected ? 100.0 : 200.0,
                        height: selected ? 100.0 : 100.0,

                        decoration: BoxDecoration(
                            color: selected ? Colors.red : Colors.blue,
                          borderRadius: BorderRadius.circular(selected ?50:0.0)
                        ),
                        alignment:
                        selected ? Alignment.center : AlignmentDirectional.topCenter,
                        duration: const Duration(seconds: 2),
                        curve: Curves.bounceOut,
                        child: selected ?CircularProgressIndicator():Text('CLICK'),
                      ),
                    ),*/

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Expanded(
                            child: Image.asset(
                              'assets/images/banner_couple.jpg',
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )),
                        Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            bottom: 0,
                            child: Container(
                              color: Colors.black.withOpacity(0.3),
                            )),
                        Center(
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Welcome to Matrimony.com',
                                style: GoogleFonts.laila(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                      fontSize:  width_screen > 600?80:40,),
                                ),textAlign: TextAlign.center,
                              )),
                        )
                      ],
                    ),
                    Text(
                      'LOGIN',
                      style: GoogleFonts.laila(
                        textStyle: TextStyle(
                            color: Color(0xff78281F),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w800,
                            fontSize: 40),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(
                          left: 100,right: 100,top: 10,bottom: 20 ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade100),
                      child:Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          width_screen > 600? Flexible(
                            flex: 1,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    topLeft: Radius.circular(15)),
                                child: Image.asset(
                                  'assets/images/banner_img.jpg',
                                  height: 400,
                                  fit: BoxFit.cover,
                                )),
                          ):SizedBox(),

                          Flexible(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                    'Username',
                                    style: GoogleFonts.laila(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15)),
                                  ),
                                  TextField (
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Enter Name',
                                        hintText: 'Enter Your Name'
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Password',
                                    style: GoogleFonts.laila(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15)),
                                  ),
                                  TextField (
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Enter Password',
                                        hintText: 'Enter Your Name'
                                    ),
                                    obscureText: true,
                                    textInputAction: TextInputAction.done,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(onPressed: (){}, child: Text('Submit'))
                                ],
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                    Text(
                      'SEARCH',
                      style: GoogleFonts.laila(
                        textStyle: TextStyle(
                            color: Color(0xff78281F),
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w800,
                            fontSize: 40),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(left: 5, bottom: 5, top: 5),
                            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),
                                ),
                                color: _select_mf == 'm' ? Colors.pink : Colors.white,
                                boxShadow: [BoxShadow(color: Colors.pink)]),
                            child: Text(
                              'Male',
                              style: TextStyle(
                                color: _select_mf == 'm' ? Colors.white : Colors.pink,
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _select_mf = 'm';
                            });
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(right: 5, bottom: 5, top: 5),
                            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                ),
                                color: _select_mf == 'f' ? Colors.pink : Colors.white,
                                boxShadow: [BoxShadow(color: Colors.pink)]),
                            child: Text(
                              'Female',
                              style: TextStyle(
                                color: _select_mf == 'f' ? Colors.white : Colors.pink,
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _select_mf = 'f';
                            });
                          },
                        ),
                      ],
                    ),


                    SizedBox(height: 10,),
                    _loading==false?ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: _search_data.length,
                      itemBuilder: (context,index){
                        return Container(child: Text(_search_data[index].qualiName),);
                      },
                    ):CircularProgressIndicator(),

                    SizedBox(height: 50,),

                    Image.network(
                      'https://colibriwp.com/blog/wp-content/uploads/2018/05/website-footers.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),


                  ],
                ),
              ),
            )));
  }
}
