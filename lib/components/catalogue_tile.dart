import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store/models/cart.dart';
import 'package:sneaker_store/models/shoe.dart';

class CatalogueTile extends StatelessWidget {
  CatalogueTile({ super.key, required this.shoe, required this.onTap });

  final Shoe shoe;

  void Function(Shoe shoe)? onTap;

  @override
  Widget build(BuildContext context){
    return Consumer<CartModel>(builder: (context, value, child) => GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/shoe', arguments: shoe);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          GestureDetector(
            onTap: () => onTap!(shoe),
            child: Icon(Icons.favorite, color: (value.favorite.contains(shoe)) ? Colors.redAccent : Colors.black)),
          Expanded(child: Image.asset(shoe.imagePath,
            )),
      
          Text(shoe.name)
        ],)
      ),
    ),);
  }
}