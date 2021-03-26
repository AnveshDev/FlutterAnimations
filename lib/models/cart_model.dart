import 'dart:collection';

import 'package:flutter/material.dart';


class CartModel extends ChangeNotifier {
  List<ListItem> _items=[];
  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<ListItem> get items => UnmodifiableListView(_items);

  /// The current total price of all items (assuming all items cost $42).
  int get totalPrice => _items.length * 42;

  void addItem(ListItem item){
    _items.add(item);
    notifyListeners();
  }

  void removeAll(){
    _items.clear();
    notifyListeners();
  }
  
}

class ListItem{
  String title;
  String amount;
  ListItem({this.title,this.amount});
}