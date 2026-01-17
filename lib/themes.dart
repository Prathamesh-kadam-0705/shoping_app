import 'package:flutter/material.dart';

class Themes {

  static Color c1 =  Colors.deepOrange.shade400;

  static Color iconColor = Colors.white;

  static TextStyle st1 = TextStyle(fontWeight:FontWeight.bold);

  static Padding pd1 = Padding(padding: EdgeInsets.all(2));


}

class Decorations{

  static BoxDecoration deco1({Color color = Colors.white,double n = 0}){
    return BoxDecoration(
      borderRadius: BorderRadius.circular(n),
      color: color,
    );
  }

  static InputDecoration inputdeco(){
    return InputDecoration(

      hintText: 'mobiles',
      filled: true,
      fillColor: Colors.white,
      isDense: true,

      contentPadding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      prefixIcon: Icon(Icons.search,),
      suffixIcon: Icon(Icons.camera_alt_outlined,color: Colors.grey.shade600,),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 1
          )
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.grey.shade400,
          width: 1,
        ),
      ),
    );
  }
}

