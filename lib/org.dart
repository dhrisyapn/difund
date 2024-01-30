import 'package:flutter/material.dart';
//cloud_firestore
import 'package:cloud_firestore/cloud_firestore.dart';


class OrgPage extends StatefulWidget {
  const OrgPage({super.key});

  @override
  State<OrgPage> createState() => _OrgPageState();
}

class _OrgPageState extends State<OrgPage> {

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
            ),],
        ),
        centerTitle: true,
      ),
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
     child: //get name and total from "The Rotary Foundation", "National Disaster Management Authority" , "CARE India" documents of collection 'organizations'
      StreamBuilder(
        stream: FirebaseFirestore.instance.collection('organizations').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Padding(
                padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(document['name'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                      Text(document['total'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
     
          
          
          
        },
     
       
    
    
    
      ),
      
      
    ),
  
    );
  }
}