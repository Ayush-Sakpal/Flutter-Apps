import 'package:flutter/material.dart';

class AuthenticationScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 11,),
              Column(
                children: [
                  Text("Login", style: TextStyle(color: Color(0xff324B4B), fontSize: 41, fontWeight: FontWeight.w700)),
                  SizedBox(height: 7,),
                  Text("Please sign-in to continue.", style: TextStyle(color: Color(0xff324b4b), fontSize: 21),)
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

}