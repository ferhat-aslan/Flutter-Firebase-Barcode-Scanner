import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String fruit;
  CustomCard({required this.fruit});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(9),
      padding: EdgeInsets.all(9),
      decoration: BoxDecoration(color: Colors.orange),
      child: Text(fruit),
    );
  }
}
