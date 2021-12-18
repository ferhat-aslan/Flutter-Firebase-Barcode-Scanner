import 'package:boz_yap_sifirla/widgets/promo_card.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({Key? key}) : super(key: key);

  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  //FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('products');

  DocumentReference _docref =
      FirebaseFirestore.instance.collection('products').doc('dondurmalar');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('data'),
      //   backgroundColor: Colors.white,
      // ),
      body: Container(
        child: Column(
          children: [
            StreamBuilder(
                stream: products.snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    // Text(streamSnapshot.data!.docs[0]['şeker'].toString()),
                    final querySnapshot = streamSnapshot.data;
                    return Expanded(
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: querySnapshot!.size,
                          itemBuilder: (context, index) {
                            final map = querySnapshot.docs[index];
                            return GestureDetector(
                              onTap: () {
                                print(products.snapshots());
                              },
                              child: PromoCard(
                                title: map['title'],
                                imagePath: map['img'],
                                tag: '22 Apr 2022',
                                caption: 'new Products',
                                subtitle: map['content'],
                                seker: map['tag']['seker'].toString() + '  gr',
                              ),
                            );
                          }),
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                })
          ],
        ),
      ),
    );
  }
}
