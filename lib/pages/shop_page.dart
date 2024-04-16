import 'package:flutter/material.dart';
import 'package:sneaker_store/components/shoe_tile.dart';
import 'package:sneaker_store/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({ Key? key }) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  final List<Shoe> shoes = [
    Shoe(name: 'AIR JORDAN 1 RETRO HIGH OG', price: '\$99.99', description: 'Old School Jordans are always fire!', imagePath: 'lib/images/retro.jpg'),
    Shoe(name: 'Air Jordan Classic', price: '\$99.99', description: 'Old School Jordans are always fire!', imagePath: 'lib/images/retro.jpg'),
    Shoe(name: 'Air Jordan Classic', price: '\$99.99', description: 'Old School Jordans are always fire!', imagePath: 'lib/images/retro.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
            Text('Everyone can run but not everyone uses this opportunity.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600]
            )),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [ 
            Text('Hot Picks',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold
            )),
            Text('See all', style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue
            ))
          ],),
        ),
        const SizedBox(height: 20),

        Expanded(child: 
          ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) { 
            return ShoeTile(shoe: shoes[index],)
            ;}, itemCount: shoes.length,)),
        const Padding(
          padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
          child: Divider(color: Colors.white),
        )
      ],
      
    );
  }
}