import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import firebase_store
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final email = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Color(0xff5D57EB),
        elevation: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 180,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff2EAAFA), Color(0xff8C04DB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'My Profile',
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //get name and age  from collection userdata and document and email
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Row(
                children: [
                  StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('userdata')
                        .doc(email)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          ' ${snapshot.data!['name']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.w300,
                            height: 0.07,
                          ),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Row(
                children: [
                  Text(email.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Gotham',
                        fontWeight: FontWeight.w300,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Text('Transactions',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.w300,
                )),
            //get name date amount from collection userdata document email sub collection transactions
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('userdata')
                  .doc(email)
                  .collection('transactions')
                  .orderBy('date', descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }

                return Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['name'],
                                  style: const TextStyle(
                                    color: Color(0xff5D57EB),
                                    fontSize: 20,
                                    fontFamily: 'Gotham',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                //take date in ddmmyyyy format from timestamp and convert to string
                                Text(
                                  data['date']
                                      .toDate()
                                      .toString()
                                      .substring(0, 10),
                                  style: const TextStyle(
                                    color: Color(0xff5D57EB),
                                    fontSize: 15,
                                    fontFamily: 'Gotham',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  data['amount'],
                                  style: const TextStyle(
                                    color: Color(0xff5D57EB),
                                    fontSize: 15,
                                    fontFamily: 'Gotham',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
