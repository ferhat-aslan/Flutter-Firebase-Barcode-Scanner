import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  String title;
  String? iconPath;
  Function()? onTap;

  CategoryCard({
    required this.title,
    this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 90,
        width: 130,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 16, height: 1.5, color: Colors.blue),
        ),
      ),
    );
  }
}
