import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
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
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 216,
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    
                    children: [
                      Text(
                        "UPI",
                        textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: 335,
                    height: 58,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white, // Specify the border color here
                          width: 2, // Specify the border width here
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff121438)),
                        child: Row(
                          children: [
                            SizedBox(width: 10,),
                            Image.asset("assets/gpay.png",
                            height: 45,
                            ),
                            SizedBox(width: 10,),
                            Text("Gpay",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),),
                          ],
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
                          color: Color(0xff121438)),
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Image.asset("assets/paytm.png",
                              height: 44,
                              ),
                              SizedBox(width: 10,),
                              Text("Paytm",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),),
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
                          color: Color(0xff121438)),
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Image.asset("assets/phonepe.png",
                              height: 45,
                              ),
                              SizedBox(width: 10,),
                              Text("PhonePe",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),),
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
