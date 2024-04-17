import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store/components/cart_tile.dart';
import 'package:sneaker_store/models/cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(builder: (context, value, child) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(children: [
        const Text('My Cart', style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold
        )),

        Expanded(child: ListView.builder(
          itemCount: value.cart.length,
          itemBuilder: (context, index) { 
            final shoe = value.cart[index];
            return CartTile(shoe: shoe);
          },
        ),)
      ],),
    ));
  }
}