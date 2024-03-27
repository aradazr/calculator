// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorBttn extends StatelessWidget {
  
final String text;
final Color numberColor;
final Color backGroundcolor;
final double textSize;
final FontWeight? fontWeight;
final Function callBack;
final double height;
final double width;
const CalculatorBttn({super.key, 
 required this.text,
 required this.numberColor ,
 required this.backGroundcolor,
 required this.textSize,
 required this.callBack,
 required this.height,
 required this.width,
 this.fontWeight,

});
  @override
  Widget build(BuildContext context) {
   
    return Container(
                    
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(17)),
                    height: height,
                    width:width ,
                    child: ElevatedButton(
                           
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
              
                          backgroundColor: backGroundcolor,
                          shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(17),
                          ),
                          fixedSize: Size(300, 300)
                        ),
                         onPressed: () {
                     callBack(text);
                         },
                        child: Text(text,
                        style: TextStyle(
                          fontSize: textSize,
                          fontWeight:fontWeight ,
                          color: numberColor
                        ),
                        )),
                  );
  }
}
