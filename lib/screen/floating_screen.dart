import 'package:boz_yap_sifirla/data/product_card.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

String? searchKey;
Stream? streamQuery;
Stream? streamQueryBar;

String searchField = 'title';

class FloatingScreen extends StatefulWidget {
  @override
  _FloatingScreenState createState() => _FloatingScreenState();
}

class _FloatingScreenState extends State<FloatingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            children: [
              Center(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                        decoration: InputDecoration(
                          hintText: 'fsdfsdf',
                          icon: Icon(Icons.star),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.blue.shade100,
                          contentPadding: EdgeInsets.all(9),
                        ),
                        onChanged: (ff) {
                          setState(() {
                            searchKey = ff;
                            streamQuery = FirebaseFirestore.instance
                                .collection('products')
                                .where('title',
                                    isGreaterThanOrEqualTo: searchKey)
                                .where('title', isLessThan: searchKey! + 'z')
                                .snapshots();
                          });
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              StreamBuilder(
                  stream: streamQuery,
                  builder: (BuildContext context,
                      AsyncSnapshot<dynamic> streamSnapshot) {
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

                              return GestureDetector(
                                  onTap: () {},
                                  child: buildProductCard(context, mapp));
                            }),
                      );
                    }

                    return Center(
                      child: Text('Bekliyor'),
                    );
                  })
            ],
          )),
    );
  }
}
