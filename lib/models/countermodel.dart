import 'package:flutter/material.dart';

class Counter extends ChangeNotifier{
  int _count=0;
  int get getValue{
    return _count;
  }

  void incrementValues(){
    _count +=1;
    notifyListeners();
  }

  void decrementValues(){
    if(_count!=0){
      _count -=1;
    }
    notifyListeners();
  }
}