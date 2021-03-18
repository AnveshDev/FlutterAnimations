import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import 'list_model.dart';

void main() async {
  runApp(TimelineApp());
}

class TimelineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timeline Demo',
      home: LinkedScrollables(),
    );
  }
}
class LinkedScrollables extends StatefulWidget {
  @override
  _LinkedScrollablesState createState() => _LinkedScrollablesState();
}

class _LinkedScrollablesState extends State<LinkedScrollables> {
  LinkedScrollControllerGroup _controllers;
  ScrollController _letters;
  ScrollController _numbers;

  List<dynamic> _countriesType_data;
  List<dynamic> _idsdata;
  ListsModel full_data;
  Future<String> _loadCountriesType() async {
    final String response =
    await rootBundle.loadString('assets/json/countries.json');
    try {
      debugPrint(response);
      Map<String, dynamic> map = json.decode(response);
      _countriesType_data = map["Data"];
      setState(() {});
      full_data = ListsModel.fromJson(jsonDecode(response));

      print('C: ' + '$full_data');
      return response;
    } catch (e) {
      debugPrint('${e}');
    }
  }

  @override
  void initState() {
    super.initState();
    _loadCountriesType();
    _controllers = LinkedScrollControllerGroup();
    _letters = _controllers.addAndGet();
    _numbers = _controllers.addAndGet();
  }

  @override
  void dispose() {
    _letters.dispose();
    _numbers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            children: [
              Container(
                height: 50,
                child: ListView.builder(
                  controller: _letters,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: full_data.data.length,
                    itemBuilder: (context, index) {
                      return  Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: Text(
                          full_data.data[index].title,
                          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20,color: Colors.white),
                        ),
                      );
                    }),
              ),
              Expanded(
                child:   ListView.builder(
                    controller: _numbers,
                    itemCount: full_data.data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            full_data.data[index].title,
                            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: full_data.data[index].id.length,
                              itemBuilder: (context, index2) {
                                return Text(full_data.data[index].id[index2].name,style: TextStyle(fontSize: 40,fontWeight: FontWeight.normal),);
                              })
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final String caption;

  _Tile(this.caption);

  @override
  Widget build(_) => Container(
    margin: const EdgeInsets.all(8.0),
    padding: const EdgeInsets.all(8.0),
    height: 250.0,
    child: Center(child: Text(caption)),
  );
}