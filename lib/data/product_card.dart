import 'package:boz_yap_sifirla/screen/OtherPage.dart';
import 'package:flutter/material.dart';
import 'product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Widget buildProductCard(
  BuildContext context,
  Map<String, dynamic> qSnap,
) {
  var product = Product.fromSnapshot(qSnap);
  var ww = MediaQuery.of(context).size.width;
  var hh = MediaQuery.of(context).size.height;

  return Container(
    width: ww * 0.85,
    height: hh * 0.28,
    child: Card(
      color: Colors.grey.shade400,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ww * 0.07)),
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.all(ww * 0.02),
          child: Column(
            children: [
              Center(
                child: Text(product.title.toString()),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
