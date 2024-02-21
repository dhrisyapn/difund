import 'package:difund/payment.dart';
import 'package:flutter/material.dart';

class DonatePage extends StatefulWidget {
  const DonatePage({super.key});

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffE31298), Color(0xff1402C8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 216,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 100),
                child: Text(
                  "Enter amount",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        prefixText: '₹ ', // Add rupee symbol here
                        prefixStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20), // Style the rupee symbol
                        hintText: 'amount',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1))),
                    keyboardType: TextInputType.number, //number keyboard type
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              //gesture detector button with text "continue"
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: const Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
