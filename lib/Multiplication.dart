import 'dart:math';
import 'package:flutter/material.dart';
import 'const.dart';
import 'my_button.dart';


class Multiplication extends StatefulWidget {
  const Multiplication({super.key});

  @override
  State<Multiplication> createState() => _MultiplicationState();
}

class _MultiplicationState extends State<Multiplication> {
  //number pad list
  List<String> numberPad = [
    '7',
    '8',
    '9',
    '<-',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0',
    '-',
    '.',
  ];
  //Question
  int numberA = 5;
  int numberB = 2;

  //User Answer
  String userAnswer = '';
  //User Tapped the button
  void buttonTapped(String button){

    setState(() {

      if (button == '='){
        //calculate if user is correct or not
        checkResult();
      }
      // clear the last digit
      else if(button == '<-'){
        if(userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      }

      //clear the input
      else if(button == 'DEL'){
        userAnswer = '';
      }
      //maximum of 3 numbers can be inputted
      else if(userAnswer.length<3) {
        userAnswer += button;
      }
    });
  }

  void checkResult(){
    if(numberA * numberB == int.parse(userAnswer)){
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              backgroundColor: Colors.blue,
              content: Container(
                height: 200,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Correct!',
                      style: whiteTextStyle,
                    ),

                    //button for next question
                    GestureDetector(
                      onTap: goToNextQuestion,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );

          }
      );
    }
    else{
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              backgroundColor: Colors.blue,
              content: Container(
                height: 200,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Sorry! Try Again',
                      style: whiteTextStyle,
                    ),

                    //button for next question
                    GestureDetector(
                      onTap: goBackToQuestion,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Icon(
                          Icons.rotate_left,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );

          }
      );
    }
  }
  //create questions
  var randomNumber = Random();


  void goToNextQuestion(){
    //dismiss the alert dialog
    Navigator.of(context).pop();

    //reset values
    setState(() {
      userAnswer = '';
    });

    //create a new question
    numberA = randomNumber.nextInt(10);
    numberB = randomNumber.nextInt(10);
  }

  void goBackToQuestion(){
    //dismiss the alert dialog
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        children: [
          //level progress
          Container(
            height: 200,
            color: Colors.blue,
          ),

          //question
          Expanded(
              child: Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //question

                      Text(
                        numberA.toString() + ' x ' + numberB.toString() + ' = ',
                        style: whiteTextStyle,
                      ),

                      //answer box
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: Center(
                          child: Text(
                            userAnswer,
                            style: whiteTextStyle,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),

          //number pad
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                  itemCount: numberPad.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index){
                    return MyButton(
                      child: numberPad[index],
                      onTap: () => buttonTapped(numberPad[index]),
                    );
                  }
              ),
            ),
          ),
        ],
      ),

    );
  }
}
