// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:difund/login.dart';
import 'package:difund/org.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullname = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  bool visible = false;
  var eyeicon = const Icon(Icons.visibility_off);
  void toggleicon() {
    setState(() {
      visible = !visible;
      if (!visible) {
        eyeicon = const Icon(Icons.visibility);
      } else {
        eyeicon = const Icon(Icons.visibility_off);
      }
    });
  }

  bool visible1 = false;
  var eyeicon1 = const Icon(Icons.visibility_off);
  void toggleicon1() {
    setState(() {
      visible1 = !visible1;
      if (!visible1) {
        eyeicon1 = const Icon(Icons.visibility);
      } else {
        eyeicon1 = const Icon(Icons.visibility_off);
      }
    });
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 216,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 30, top: 30),
                child: Text(
                  "Create account",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    controller: fullname,
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                        hintText: 'Full name',
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
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    controller: emailController,
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                        hintText: 'Email',
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
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    controller: passwordController,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: toggleicon,
                          icon: eyeicon,
                          color: Colors.white,
                        ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1))),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    obscureText: !visible,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    controller: repasswordController,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: toggleicon1,
                          icon: eyeicon1,
                          color: Colors.white,
                        ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1))),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    obscureText: !visible1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: GestureDetector(
                    onTap: () async {
                      if (fullname.text.isEmpty ||
                          emailController.text.isEmpty ||
                          passwordController.text.isEmpty ||
                          repasswordController.text.isEmpty) {
                        //show snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Please fill all fields',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Gotham',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            backgroundColor: Color(0xFFFF6D00),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        //check email is valid using regex
                        if (RegExp(
                                r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                            .hasMatch(emailController.text)) {
                          //check password and confirm password are same
                          if (passwordController.text ==
                              repasswordController.text) {
                            //sign up user using firebase
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text)
                                .then((value) async {
                              //add fullname to collection 'userdata' to doc email address of user to firestore
                              await FirebaseFirestore.instance
                                  .collection('userdata')
                                  .doc(emailController.text)
                                  .set({
                                'name': fullname.text,
                              });

                              //naviagte to homepage()
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const OrgPage()));
                            }).catchError((e) {
                              //show snackbar
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Something went wrong',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Gotham',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  backgroundColor: Color(0xFFFF6D00),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            });
                          } else {
                            //show snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Password and Confirm Password are not same',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Gotham',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                backgroundColor: Color(0xFFFF6D00),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        } else {
                          //show snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please enter a valid email address',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Gotham',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              backgroundColor: Color(0xFFFF6D00),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      }
                    },
                    child: const Center(
                      child: Text(
                        "Create account",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: const Text(
                  "Sign in here",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
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
