import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sneaker_store/models/shoe.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function() onTap;
  ShoeTile({ super.key, required this.shoe, required this.onTap });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/shoe', arguments: shoe);
      },
      child: Container(
        margin: EdgeInsets.only(left: 25),
        width: 260,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ 
            ClipRRect(borderRadius: BorderRadius.circular(12),child: Image.asset(shoe.imagePath)),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(shoe.name, textAlign: TextAlign.center,),
            ),
      
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: [ 
                      const Text('Price',
                        style: TextStyle( 
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      const SizedBox(height: 5),
                      Text(shoe.price,
                        style: const TextStyle( 
                          color: Colors.grey,
                        ))
                    ],
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration( 
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12))
                      ),
                      child: const Icon(Icons.add, color: Colors.white)),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}