import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String? title;
  String? barcodeNumber;
  String? price;
  String? imagePath;
  String? content;
  String? co2;
  String? seker;
  String? vitaminA;
  List? tag;

  Product(this.title, this.barcodeNumber, this.price, this.imagePath,
      this.content, this.co2, this.seker, this.vitaminA);
  Product.fromSnapshot(Map<String, dynamic> map) {
    title = map['title'];
    barcodeNumber = map['barcode'];
    price = map['price'];
    imagePath = map['img'];
    content = map['content'];
    co2 = map['tag']['co2'];
    seker = map['tag']['seker'];
    vitaminA = map['tag']['vitaminA'];
    tag = [co2, seker, vitaminA];
  }
}
