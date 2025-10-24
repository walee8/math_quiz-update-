import 'package:flutter/material.dart';
import 'const.dart';

class MyButton extends StatelessWidget {
  final String child;
  final VoidCallback onTap;
  var buttonColor = Colors.blue[400];

  MyButton({super.key, required this.child, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if(child == '<-'){
      buttonColor = Colors.green;
    }
    else if(child == 'DEL'){
      buttonColor = Colors.red;
    }
    else if(child == '='){
      buttonColor = Colors.blue;
    }
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),

          child: Center(
            child: Text(
              child,
              style: whiteTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
