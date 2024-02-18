import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterconnect/utils/firebase_const.dart';

class FireStoreServices {
  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUser(userId) {
    return firestore.collection('users').doc(userId).snapshots();
  }
}
