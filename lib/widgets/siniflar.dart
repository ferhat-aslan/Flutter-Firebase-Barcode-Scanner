import 'package:flutter/material.dart';

class CateClass {
  String titlle;
  String? iconn;

  CateClass({
    required this.titlle,
    this.iconn,
  });
}

class Itemm {
  String name;
  String imagePath;
  int barcode;
  double? price;
  double? seker;
  double? rating;
  Itemm({
    required this.name,
    required this.imagePath,
    required this.barcode,
    this.price,
    this.seker,
    this.rating,
  });

// ignore: empty_constructor_bodies
}
