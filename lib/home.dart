import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shoping_app/Cart.dart';
import 'package:shoping_app/account.dart';
import 'package:shoping_app/catagories.dart';
import 'package:shoping_app/home_page.dart';
import 'package:shoping_app/play.dart';

class Home extends StatefulWidget{

  Home({super.key});

  State<Home> createState() => HomeState();
}

class HomeState extends State<Home>{

  int currentIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    Play(),
    Catagories(),
    Account(),
    Cart()
  ];

  Widget build(BuildContext context){
    return Scaffold(

      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index){
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined,),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.video_chat_outlined),label: "Play"),
            BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: "Account"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: "Cart"),
          ]
      ),

    );
  }
}