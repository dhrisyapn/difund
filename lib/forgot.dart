import 'package:flutter/material.dart';
//import all firebase for reset link
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 216,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 300),
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    "We will send you a link to reset password.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      controller: emailController,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                          hintText: 'Email address',
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
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //send reset link
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: emailController.text);
                    //show snackbar
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Reset link sent to your email"),
                    ));
                    //pop
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 20),
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: const Center(
                        child: Text(
                          "Send Link",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
