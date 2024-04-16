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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: (){Scaffold.of(context).openDrawer();},
              icon: const Icon(Icons.menu, color: Colors.black)
              );
          }
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Column(
            children: [
          DrawerHeader(child: Image.asset('lib/images/logo.png',
          color: Colors.white,
          width: 120,
          ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text("Home", style: TextStyle(color: Colors.white))),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.info, color: Colors.white),
              title: Text("About", style: TextStyle(color: Colors.white))),
          ),
          
        ],
        ),
        const Padding(
            padding: EdgeInsets.only(left: 25.0, bottom: 25),
            child: ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text("Logout", style: TextStyle(color: Colors.white))),
          ),
          
        ],),
      ),
    );
  }
}