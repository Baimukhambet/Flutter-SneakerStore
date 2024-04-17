import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store/models/cart.dart';
import 'package:sneaker_store/models/shoe.dart';

class ShoePage extends StatefulWidget {
  ShoePage({ super.key });

  @override
  State<ShoePage> createState() => _ShoePageState();
}

class _ShoePageState extends State<ShoePage> {
  late Shoe shoe;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is Shoe);
    shoe = args as Shoe;
    setState(() {});
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(shoe.name)
      ),
      body: Consumer<CartModel>(builder: (context, value, child) =>  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Expanded(flex: 1, child: Image.asset(shoe.imagePath)),
        Expanded(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(shoe.name, style: const TextStyle( 
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(shoe.price, style: const TextStyle( 
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  )),
                  GestureDetector(
                    onTap: () {
                      if(value.favorite.contains(shoe)) {
                        value.removeFavorite(shoe);
                      } else {
                        value.addFavorite(shoe);
                      }
                    },
                    child: Icon(Icons.favorite, size: 48,
                      color: (value.favorite.contains(shoe) ? Colors.redAccent : Colors.black)
                    ))
                ],
              ),
          
              Expanded(child: SizedBox(
                child: Text(shoe.description, style: TextStyle( 
                  fontSize: 16,
                  color: Colors.grey[700],
                ))
              ),),

              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){
                showDialog(context: context, builder:(context) => const AlertDialog(
                  title: Text('Added!', textAlign: TextAlign.center,)
                ));
                value.addToCart(shoe);
              }, child: const Text("Add To Cart")),)
              

            ],
          ),
        ))
      ],),)
    );
  }
}