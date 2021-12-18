import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  Future getData(String collectionName) async {
    final FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
    QuerySnapshot snapshot =
        await firebaseFireStore.collection(collectionName).get();
    return snapshot.docs;
  }
}
