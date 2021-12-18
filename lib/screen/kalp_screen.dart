import 'package:boz_yap_sifirla/data/product.dart';
import 'package:boz_yap_sifirla/data/product_card.dart';
import 'package:boz_yap_sifirla/widgets/product_detailpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

double ww = Get.width;
double hh = Get.height;
String value = '';
String abcd = '';
Stream? sonstr;
var map;

class KalpScreen extends StatefulWidget {
  KalpScreen({Key? key}) : super(key: key);

  @override
  _KalpScreenState createState() => _KalpScreenState();
}

class _KalpScreenState extends State<KalpScreen> {
  Future ScanBarcode(BuildContext context) async {
    abcd = await FlutterBarcodeScanner.scanBarcode(
        '#004297', 'Cancel', true, ScanMode.DEFAULT);
    setState(() {
      value = abcd;
      sonstr = FirebaseFirestore.instance
          .collection('products')
          .where('barcode', isGreaterThanOrEqualTo: value)
          .where('barcode', isLessThan: value + 'z')
          .snapshots();
    });
  }

  /*Future getProduct(BuildContext context, String valuee) async {
    var streamm = await FirebaseFirestore.instance
            .collection('products')
            .where('title', isGreaterThanOrEqualTo: 'Mado çikolatalı Dondurma')
            .where('title', isLessThan: 'Mado çikolatalı Dondurma' + 'z')
            .getDocuments(),
    setState(() {
      stream = streamm;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    // map = sonstr.docs;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              ScanBarcode(context);
            },
            icon: Icon(
              Icons.qr_code,
              color: Colors.black,
            )),
      ),
      body: (value == '' || value == null || value == -1 || value == 0)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Bekleyiniz',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          : StreamBuilder(
              stream: sonstr,
              builder: (BuildContext context,
                  AsyncSnapshot<dynamic> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  // Text(streamSnapshot.data!.docs[0]['şeker'].toString()),
                  final querySnapshot = streamSnapshot.data;
                  final map = querySnapshot.docs[0];
                  final Map<String, dynamic> mapp =
                      map.data() as Map<String, dynamic>;
                  return buildProductDetailPage(context, mapp);
                }

                return Center(
                  child: Text('Bekliyor'),
                );
              }),
    ));
  }
}
