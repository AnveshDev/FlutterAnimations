import 'package:flutter/material.dart';
import 'package:flutter_app/models/countermodel.dart';
import 'package:provider/provider.dart';

class CounterSecondScreen extends StatefulWidget {
  @override
  _CounterSecondScreenState createState() => _CounterSecondScreenState();
}

class _CounterSecondScreenState extends State<CounterSecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Provider<Counter>(create: (context) {
      return Counter();
    }, child: SafeArea(child: Scaffold(body: Container(
      child: Consumer<Counter>(
        builder: (context, counter, child) {
          return Text('${counter.getValue}');
        },
      ),
    ))));
  }
}
