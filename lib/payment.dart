import 'package:difund/paymentsuccess.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
                Padding(
                  padding: const EdgeInsets.only(top: 10),
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
              ],
            ),
          ),
        ));
  }
}
