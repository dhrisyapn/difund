import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
  bool visible1=false;
  var eyeicon1=Icon(Icons.visibility_off);
  void toggleicon1(){
    
    setState(() {
      visible1=!visible1;
      if(!visible1){
        eyeicon1=Icon(Icons.visibility);
    }
    else{
     
        eyeicon1=Icon(Icons.visibility_off);
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
              Image.asset('assets/logo.png',
            width: 216,
            ),
             Padding(
            padding: const EdgeInsets.only(right: 30,top: 30),
            child: Text("Create account",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
          ),
             Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
            child: SizedBox(height: 50,
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                hintText: 'Full name',hintStyle: TextStyle(color: Colors.white,fontSize: 20,),
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
                hintText: 'Email',hintStyle: TextStyle(color: Colors.white,fontSize: 20,),
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
            padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
            child: SizedBox(height: 50,
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  suffixIcon: IconButton(onPressed: toggleicon1, icon: eyeicon1,color: Colors.white,),
                  hintText: 'Password',hintStyle: TextStyle(color: Colors.white,fontSize: 20,),
                                 enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1)),
                                 focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1))
                                 ),
                                 style: TextStyle(color: Colors.white,fontSize: 20),
                                  obscureText: visible1,
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