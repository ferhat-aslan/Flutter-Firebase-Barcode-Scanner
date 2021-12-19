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
    title = map['title'].toString();
    barcodeNumber = map['barcode'].toString();
    price = map['price'].toString();
    imagePath = map['img'].toString();
    content = map['content'].toString();
    co2 = map['tag']['co2'].toString();
    seker = map['tag']['seker'].toString();
    vitaminA = map['tag']['vitaminA'].toString();
    tag = [co2, seker, vitaminA].toList();
  }
}
