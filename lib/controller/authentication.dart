import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //signin user
  Future<String> signInUser({
    required String email,
    required String password,
    required String username,
  }) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
        UserCredential cred = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);

        //store user data in firebase collection

        await _firebaseFirestore.collection('users').doc(cred.user!.uid).set({
          'email': email,
          'username': username,
          'uid': cred.user!.uid,
          'createdAt': FieldValue.serverTimestamp(),
        });
        res = 'success';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

//login User

  Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);

        res = 'success';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
