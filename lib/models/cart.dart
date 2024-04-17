import 'package:flutter/material.dart';
import 'package:sneaker_store/models/shoe.dart';

class CartModel extends ChangeNotifier {
  List<Shoe> collection = [
    Shoe(name: 'AIR JORDAN 1 RETRO HIGH OG', price: '\$99.99', description: 'Old School Jordans are always fire!', imagePath: 'lib/images/retro.jpg'),
    Shoe(name: 'TRAVIS SCOTT X AIR JORDAN 1 RETRO LOW', price: '\$99.99', description: 'Old School Jordans are always fire!', imagePath: 'lib/images/travis.jpg'),
    Shoe(name: "NEW BALANCE 530 'STEEL GREY'", price: '\$99.99', description: 'Old School Jordans are always fire!', imagePath: 'lib/images/nb.jpg'),
    Shoe(name: "Puma Cali Star", price: '\$99.99', description: 'Old School Jordans are always fire!', imagePath: 'lib/images/puma.jpg'),
  ];

  List<Shoe> cart = [];

  void addToCart(Shoe shoe) {
    cart.add(shoe);
    notifyListeners();
  }

  void removeFromCart(Shoe shoe) {
    cart.remove(shoe);
    notifyListeners();
  }
}