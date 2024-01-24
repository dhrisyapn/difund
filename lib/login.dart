import 'package:difund/home.dart';
import 'package:difund/signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visible=false;
  var eyeicon=Icon(Icons.visibility_off);
  void toggleicon(){
    
    setState(() {
      visible=!visible;
      if(!visible){
        eyeicon=Icon(Icons.visibility);
    }
    else{
     
        eyeicon=Icon(Icons.visibility_off);
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
    decoration: BoxDecoration(
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
          Image.asset('assets/logo.png',
          width: 216,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 50),
            child: SizedBox(height: 50,
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                hintText: 'Username',hintStyle: TextStyle(color: Colors.white,fontSize: 20,),
                                 enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1)),
                                 focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1))
                                 ),
                                 style: TextStyle(color: Colors.white,fontSize: 20),
                                 ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
            child: SizedBox(height: 50,
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: toggleicon, icon: eyeicon,color: Colors.white,),
                  hintText: 'Password',hintStyle: TextStyle(color: Colors.white,fontSize: 20,),
                                 enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1)),
                                 focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1))
                                 ),
                                 style: TextStyle(color: Colors.white,fontSize: 20),
                                  obscureText: visible,
                                 ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30,top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forgot Password",style: TextStyle(fontSize: 17,color: Colors.white),),
              ],
            ),
          ),
           Padding(
             padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
             child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white
                    ),
                    child: GestureDetector(
                      onTap: () {
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  },
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                          ),),
                      ),
                    ),
                    
                   ),
           ),
           Padding(
             padding: const EdgeInsets.only(top: 20),
             child: Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                    ),),
           ),
           GestureDetector(
            onTap: () {
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
                  },
             child: Text(
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