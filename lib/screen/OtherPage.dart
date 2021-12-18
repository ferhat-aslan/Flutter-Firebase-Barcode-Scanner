import 'package:boz_yap_sifirla/data/product_card.dart';
import 'package:boz_yap_sifirla/screen/floating_screen.dart';
import 'package:boz_yap_sifirla/screen/kalp_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

CollectionReference products =
    FirebaseFirestore.instance.collection('products');
CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('products');

class OtherPage extends StatefulWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('OtherPage'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => KalpScreen()));
                });
              },
              icon: Icon(Icons.favorite_border_rounded))
        ],
      ),
      body: Column(
        children: [
          Center(
              child: StreamBuilder(
                  stream: products.snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      // Text(streamSnapshot.data!.docs[0]['şeker'].toString()),
                      final querySnapshot = streamSnapshot.data;
                      return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: querySnapshot!.size,
                            itemBuilder: (context, index) {
                              final map = querySnapshot.docs[index];
                              final Map<String, dynamic> mapp =
                                  map.data() as Map<String, dynamic>;

                              return buildProductCard(context, mapp);
                            }),
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  })),
        ],
      ),
    );
  }
}
