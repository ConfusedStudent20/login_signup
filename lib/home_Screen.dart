import 'package:flutter/material.dart';
import 'package:flutterconnect/services/firestore_Services.dart';
import 'package:flutterconnect/utils/colors.dart';
import 'package:flutterconnect/utils/firebase_const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Confused Student'),
          centerTitle: true,
        ),
        drawer: Drawer(
          backgroundColor: Colors.green,
          child: StreamBuilder(
            stream: FireStoreServices.getUser(auth.currentUser!.uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: blackColor,
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error : ${snapshot.hasError}'));
              } else {
                if (snapshot.hasData) {
                  var data = snapshot.data!;
                  return ListView(
                    children: [
                      UserAccountsDrawerHeader(
                        accountName: Text(data['username']),
                        accountEmail: Text(data['email']),
                        currentAccountPicture: const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  );
                }
              }
              return const Text('Confused Student');
            },
          ),
        ),
      ),
    );
  }
}
