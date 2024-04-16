import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sneaker_store/pages/home_page.dart';

class IntroPage extends StatelessWidget {
const IntroPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: Image.asset('lib/images/logo.png', height: 110,),
            ),
            const SizedBox(height: 40),
            const Text('Just Do It', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            )),
            const SizedBox(height: 40),
            const Text('Brand new sneakers made with love and joy to fulfill all your needs!', style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ), textAlign: TextAlign.center,),
            const SizedBox(height: 48),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),)),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12)
                ),
                padding: const EdgeInsets.all(25.0),
                child: const Center(child: Text('Shop Now', style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                )))
              ),
            )
          ],),
        ),
      )
    );
  }
}