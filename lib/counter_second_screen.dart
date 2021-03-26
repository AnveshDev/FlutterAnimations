import 'package:flutter/material.dart';
import 'package:flutter_app/models/countermodel.dart';
import 'package:provider/provider.dart';

import 'models/cart_model.dart';

class Consumercart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>CartModel(),),
      Provider(create: (context)=>SomeOtherClass())

    ],
        child: CounterSecondScreen());
  }
}

class CounterSecondScreen extends StatefulWidget {
  @override
  _CounterSecondScreenState createState() => _CounterSecondScreenState();
}

class _CounterSecondScreenState extends State<CounterSecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        return Text("Total price: ${cart.totalPrice}");
      },
    );
  }
}

class SomeOtherClass extends StatefulWidget {
  @override
  _SomeOtherClassState createState() => _SomeOtherClassState();
}

class _SomeOtherClassState extends State<SomeOtherClass> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

