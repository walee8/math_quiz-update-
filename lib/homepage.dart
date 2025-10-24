import 'package:flutter/material.dart';
import 'package:math_game/Multiplication.dart';
import 'package:math_game/addition.dart';
import 'package:math_game/substraction.dart';
import 'division.dart';
import 'navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> items = const [
    {
      'title': 'Addition',
      'color': Color(0xFFFFC107),
      'icon': Icons.add,
    },
    {
      'title': 'Subtraction',
      'color': Color(0xFF4CAF50),
      'icon': Icons.horizontal_rule,
    },
    {
      'title': 'Multiplication',
      'color': Color(0xFFE91E63),
      'icon': Icons.close,
    },
    {
      'title': 'Division',
      'color': Color(0xFF9C27B0),
      'icon': Icons.calculate,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header section
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF00AEEF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              padding: const EdgeInsets.all(20),
              child: Column(
                children: const [
                  SizedBox(height: 20),
                  Icon(
                    Icons.calculate,
                    color: Colors.yellow,
                    size: 80,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Count on Math for Success",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // Clickable GridView
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return GestureDetector(
                      onTap: () {
                        if(item['title'] == 'Addition'){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Addition()),
                          );
                        }
                        else if(item['title'] == 'Subtraction'){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Substraction()),
                          );
                        }
                        else if(item['title'] == 'Multiplication'){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Multiplication()),
                          );
                        }
                        else if (item['title'] == 'Division'){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Division()),
                          );
                        }
                      },
                      child: Navigation(
                        title: item['title'],
                        color: item['color'],
                        icon: item['icon'],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

