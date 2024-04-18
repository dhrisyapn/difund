import 'dart:math';

import 'package:difund/paymentsuccess.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import firebase_store
import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentPage extends StatefulWidget {
  String amount;
  String org;
  PaymentPage({super.key, required this.amount, required this.org});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final email = FirebaseAuth.instance.currentUser!.email;
  //function that returns 32 length random string(start with 0x and contain 0-9,a-z)
  String randomString() {
    const _chars = '0123456789abcdefghijklmnopqrstuvwxyz';
    final Random _rnd = Random.secure();
    return String.fromCharCodes(Iterable.generate(
        32, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff2EAAFA), Color(0xff8C04DB)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 216,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Text("UPI",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    //save org,amount,current date timestamp,email,randomString() to collection 'blockchain'
                    FirebaseFirestore.instance.collection('blockchain').add({
                      'orga': widget.org,
                      'amount': widget.amount,
                      'date': DateTime.now(),
                      'email': email,
                      'tx': randomString(),
                    });
                    //add amount value to 'total' value in collection 'organizations' and document with field 'name' is  widget.org(amount and total are strings,convert to int and add)
                    FirebaseFirestore.instance
                        .collection('organizations')
                        .where('name', isEqualTo: widget.org)
                        .get()
                        .then((QuerySnapshot querySnapshot) {
                      querySnapshot.docs.forEach((doc) {
                        FirebaseFirestore.instance
                            .collection('organizations')
                            .doc(doc.id)
                            .update({
                          'total': (int.parse(doc['total']) +
                                  int.parse(widget.amount))
                              .toString()
                        });
                      });
                    });
                    //add amount,date,randomString() to collection userdata, document with id email and  subcollection 'transactions'
                    FirebaseFirestore.instance
                        .collection('userdata')
                        .doc(email)
                        .collection('transactions')
                        .add({
                      'amount': widget.amount,
                      'date': DateTime.now(),
                      'tx': randomString(),
                      'org': widget.org,
                    });
                    //go to payment success page without route
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentSuccess()),
                    );
                  },
                  child: Container(
                    width: 335,
                    height: 58,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white, // Specify the border color here
                          width: 2, // Specify the border width here
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff121438)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/gpay.png",
                          height: 45,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Gpay",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () {
                      //save org,amount,current date timestamp,email,randomString() to collection 'blockchain'
                      FirebaseFirestore.instance.collection('blockchain').add({
                        'orga': widget.org,
                        'amount': widget.amount,
                        'date': DateTime.now(),
                        'email': email,
                        'tx': randomString(),
                      });
                      //add amount value to 'total' value in collection 'organizations' and document with field 'name' is  widget.org(amount and total are strings,convert to int and add)
                      FirebaseFirestore.instance
                          .collection('organizations')
                          .where('name', isEqualTo: widget.org)
                          .get()
                          .then((QuerySnapshot querySnapshot) {
                        querySnapshot.docs.forEach((doc) {
                          FirebaseFirestore.instance
                              .collection('organizations')
                              .doc(doc.id)
                              .update({
                            'total': (int.parse(doc['total']) +
                                    int.parse(widget.amount))
                                .toString()
                          });
                        });
                      });
                      //add amount,date,randomString() to collection userdata, document with id email and  subcollection 'transactions'
                      FirebaseFirestore.instance
                          .collection('userdata')
                          .doc(email)
                          .collection('transactions')
                          .add({
                        'amount': widget.amount,
                        'date': DateTime.now(),
                        'tx': randomString(),
                        'org': widget.org,
                      });
                      //go to payment success page without route
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaymentSuccess()),
                      );
                    },
                    child: Container(
                      width: 335,
                      height: 58,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                Colors.white, // Specify the border color here
                            width: 2, // Specify the border width here
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff121438)),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            "assets/paytm.png",
                            height: 44,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Paytm",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () {
                      //save org,amount,current date timestamp,email,randomString() to collection 'blockchain'
                      FirebaseFirestore.instance.collection('blockchain').add({
                        'orga': widget.org,
                        'amount': widget.amount,
                        'date': DateTime.now(),
                        'email': email,
                        'tx': randomString(),
                      });
                      //add amount value to 'total' value in collection 'organizations' and document with field 'name' is  widget.org(amount and total are strings,convert to int and add)
                      FirebaseFirestore.instance
                          .collection('organizations')
                          .where('name', isEqualTo: widget.org)
                          .get()
                          .then((QuerySnapshot querySnapshot) {
                        querySnapshot.docs.forEach((doc) {
                          FirebaseFirestore.instance
                              .collection('organizations')
                              .doc(doc.id)
                              .update({
                            'total': (int.parse(doc['total']) +
                                    int.parse(widget.amount))
                                .toString()
                          });
                        });
                      });
                      //add amount,date,randomString() to collection userdata, document with id email and  subcollection 'transactions'
                      FirebaseFirestore.instance
                          .collection('userdata')
                          .doc(email)
                          .collection('transactions')
                          .add({
                        'amount': widget.amount,
                        'date': DateTime.now(),
                        'tx': randomString(),
                        'org': widget.org,
                      });
                      //go to payment success page without route
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaymentSuccess()),
                      );
                    },
                    child: Container(
                      width: 335,
                      height: 58,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                Colors.white, // Specify the border color here
                            width: 2, // Specify the border width here
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff121438)),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            "assets/phonepe.png",
                            height: 45,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "PhonePe",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
