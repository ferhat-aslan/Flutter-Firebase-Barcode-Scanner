import 'package:boz_yap_sifirla/data/product.dart';
import 'package:boz_yap_sifirla/screen/OtherPage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'CustomCard.dart';

Widget buildProductDetailPage(
  BuildContext context,
  Map<String, dynamic> detailSnap,
) {
  var product = Product.fromSnapshot(detailSnap);
  var ww = Get.width;
  var hh = Get.height;
  final spec = product.tag;

  return SafeArea(
    child: Scaffold(
        body: Container(
      margin: EdgeInsets.all(14),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color.fromARGB(250, 129, 187, 242),
          borderRadius: BorderRadius.circular(22)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(
            product.title.toString(),
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.orange, width: 3)),
            child: Image.network(
              product.imagePath.toString(),
              width: 250,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            product.content.toString(),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'KEY SPECS',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (var item in product.tag ?? [])
                Container(
                  child: Text(
                    item.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.orange),
                )
            ],
          ),

/////
        ],
      ),
    )),
  );
}
