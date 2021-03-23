import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_second_screen.dart';
import 'models/countermodel.dart';

class MainMultiProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Counter())
      ],
      child: Container(
        child: IncrementCountData(),
      ),
    );
  }
}

class IncrementCountData extends StatefulWidget {
  @override
  _IncrementCountDataState createState() => _IncrementCountDataState();
}

class _IncrementCountDataState extends State<IncrementCountData> {
  _IncrementCountBuilder(context) {
  Provider.of<Counter>(context,listen: false).incrementValues();
  }
  _DecrementCountBuilder(context) {
    Provider.of<Counter>(context,listen: false).decrementValues();
  }
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context).getValue;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Text('${counter} Increment'),

              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return  CounterSecondScreen();
                }));
              }, child: Text('Counter Second'))
            ],
          ),


        ),

        floatingActionButton:Row(
          children: [
            FloatingActionButton(
              child: Icon(Icons.remove), onPressed:()=>_DecrementCountBuilder(context), tooltip: 'Decrement',),
            FloatingActionButton(
              child: Icon(Icons.add), onPressed:()=>_IncrementCountBuilder(context), tooltip: 'Increment',),
          ],
        )),
    );
  }
}
