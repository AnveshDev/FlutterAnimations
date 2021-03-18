import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'list_model.dart';

class DynamicData extends StatefulWidget {
  @override
  _DynamicDataState createState() => _DynamicDataState();
}

class _DynamicDataState extends State<DynamicData> {
  List<dynamic> _countriesType_data;
  List<dynamic> _idsdata;
  ListsModel full_data;
  ScrollController _scrollController;
  double offset = 0.0 ;

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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCountriesType();
    _scrollController = ScrollController() //keepScrollOffset: false removed
      ..addListener(() {
        setState(() {
          //<-----------------------------
          offset = _scrollController.offset;
          // force a refresh so the app bar can be updated
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Column(
          children: [
            Container(
              height: 50,
              child: ListView.builder(
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
              child: ListView(
                children: [
                  ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
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
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
