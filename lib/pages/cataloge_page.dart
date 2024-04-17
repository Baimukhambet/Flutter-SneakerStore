import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store/components/cart_tile.dart';
import 'package:sneaker_store/components/catalogue_tile.dart';
import 'package:sneaker_store/components/shoe_tile.dart';
import 'package:sneaker_store/models/cart.dart';
import 'package:sneaker_store/models/shoe.dart';

class CatalogePage extends StatefulWidget {
  const CatalogePage({ super.key });

  @override
  _CatalogePageState createState() => _CatalogePageState();
}

class _CatalogePageState extends State<CatalogePage> {
  void _likeTapped(Shoe shoe) {
    debugPrint("Tapped");
    final provider = Provider.of<CartModel>(context, listen: false);
    if(provider.favorite.contains(shoe)) {
      provider.removeFavorite(shoe);
    } else {
      provider.addFavorite(shoe);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(builder: (context, value, child) => Scaffold(
      appBar: AppBar(
        title: Text("Catalogue"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: value.collection.length,
        itemBuilder:(context, index) {
          final shoe = value.collection[index];
          return CatalogueTile(shoe: shoe, onTap: _likeTapped,);
        },),
    ),);
  }
}