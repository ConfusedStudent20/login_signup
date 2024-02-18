import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

final FirebaseFirestore firestore = FirebaseFirestore.instance;

User? user = auth.currentUser;

//collection

const userCollection = 'users';//collection name as 'users' in database
