import 'package:flutter/material.dart';
import 'package:sneaker_store/components/bottom_nav_bar.dart';
import 'package:sneaker_store/pages/cart_page.dart';
import 'package:sneaker_store/pages/shop_page.dart';

class HomePage extends StatefulWidget {
const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [ShopPage(), CartPage()];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavBar(onTabChange: (index) => navigateBottomBar(index),),
      body: _pages[_currentIndex],
    );
  }
}