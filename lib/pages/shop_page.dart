import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store/components/shoe_tile.dart';
import 'package:sneaker_store/models/cart.dart';
import 'package:sneaker_store/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({ Key? key }) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void _addShoeToCart(shoe) {
    Provider.of<CartModel>(context, listen: false).addToCart(shoe);

    showDialog(context: context, builder:(context) => AlertDialog(
      title: Text('Added!', textAlign: TextAlign.center,),
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(builder: (context, value, child) => Column(
      children: [ 
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.grey[100],
            borderRadius: BorderRadius.circular(16)
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Search"),
              Icon(Icons.search_rounded)
            ],
          )
        ),
        Padding(
          padding: EdgeInsets.all(28.0),
          child: 
            Text('Find top sneakers in our shop!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600]
            )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [ 
            const Text('Hot Picks',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold
            )),
            GestureDetector(
              onTap:() => Navigator.of(context).pushNamed('/catalogue'),
              child: const Text('See all', style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue
              )),
            )
          ],),
        ),
        const SizedBox(height: 20),

        Expanded(child: 
          ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) { 
            return ShoeTile(shoe: value.collection[index], onTap: () => _addShoeToCart(value.collection[index]),)
            ;}, itemCount: value.collection.length,)),
        const Padding(
          padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
          child: Divider(color: Colors.white),
        )
      ],
      
    ));
  }
}