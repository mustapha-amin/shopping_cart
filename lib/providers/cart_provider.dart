import 'package:flutter/cupertino.dart';
import '/models/cart.dart';

class Cartprovider extends ChangeNotifier {
  final List<CartItem> items = [
    CartItem(item: "Apple", price: 50, selected: false),
    CartItem(item: "Banana", price: 70, selected: false),
    CartItem(item: "Watermelon", price: 150, selected: false),
    CartItem(item: "Orange", price: 20, selected: false),
    CartItem(item: "Pawpaw", price: 10, selected: false),
    CartItem(item: "Strawberry", price: 45, selected: false),
    CartItem(item: "Pineapple", price: 30, selected: false),
    CartItem(item: "Grape", price: 85, selected: false),
    CartItem(item: "Guava", price: 40, selected: false),
    CartItem(item: "Mango", price: 20, selected: false),
    CartItem(item: "Blackberry", price: 30, selected: false),
    CartItem(item: "Raspberry", price: 65, selected: false),
  ];

  final List<CartItem> myCart = [];

  int _totalPrice = 0;

  String get totalPrice => "\$$_totalPrice";

  void addtoCart(int index) {
    myCart.add(items[index]);
    items[index].selected = true;
    _totalPrice += items[index].price;
    notifyListeners();
  }

  void removeFromCart(int index) {
    myCart.remove(items[index]);
    items[index].selected = false;
    _totalPrice -= items[index].price;
    notifyListeners();
  }
}
