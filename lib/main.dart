import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_store/models/cart.dart';
import 'package:sneaker_store/pages/cataloge_page.dart';
import 'package:sneaker_store/pages/home_page.dart';
import 'package:sneaker_store/pages/intro_page.dart';
import 'package:sneaker_store/pages/shoe_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => CartModel(),
    child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({ super.key });

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => IntroPage(),
        '/home': (context) => HomePage(),
        '/catalogue':(context) => CatalogePage(),
        '/shoe':(context) => ShoePage(),
      }, 
    );
  }
}