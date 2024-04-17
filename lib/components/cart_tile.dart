import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store/models/cart.dart';
import 'package:sneaker_store/models/shoe.dart';

class CartTile extends StatelessWidget {
  const CartTile({ super.key, required this.shoe });

  final Shoe shoe;
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset(shoe.imagePath, width: 120), ),
        Expanded(
          child: SizedBox(
            child: Text(shoe.name, style: TextStyle( 
              fontWeight: FontWeight.bold,
              fontSize: 12
            )),
          ),
        ),
        GestureDetector(
          onTap: () {
            final model = Provider.of<CartModel>(context, listen: false);
            model.removeFromCart(shoe);
          },
          child: Icon(Icons.delete, color: Colors.redAccent))
      ],)
    );
  }
}