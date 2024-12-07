import 'package:flutter/material.dart';
import 'package:laundry_app/dryCleanScreen.dart';
import 'package:laundry_app/ironScreen.dart';
import 'package:laundry_app/main.dart';
import 'package:laundry_app/premiumWashScreen.dart';
import 'package:laundry_app/standardWashScreen.dart';

class Homescreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
        
          scrollDirection: Axis.vertical,
        
          child: Padding(
              padding: EdgeInsets.all(27.0),
          
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
          
                    Text("Hello!", style: TextStyle(fontSize: 45),),
          
                    Text("What you need today?", style: TextStyle(fontSize: 25, color: Colors.black38),),
                  ],
                ),
          
                SizedBox(height: 35,),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          child: SizedBox(
                            height: 170,
                            width: 170,

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Material(
                                  child: Image.asset(
                                    'assets/images/laundry_basic_illustration.jpg',
                                    height: 130,
                                    width: 170,
                                    fit: BoxFit.fill,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
                                  elevation: 2,
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text("Standard Wash", style: TextStyle(fontSize: 17),),
                                )
                              ],
                            ),
                          ),

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context){
                                    return Standardwashscreen();
                                  }
                              )
                            );
                          },
                        ),
          
                        SizedBox(height: 29,),
          
                        InkWell(
                          splashColor: Colors.transparent,
                          child: SizedBox(
                            height: 170,
                            width: 170,

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Material(
                                  child: Image.asset(
                                    'assets/images/laundry_basic_illustration.jpg',
                                    height: 130,
                                    width: 170,
                                    fit: BoxFit.fill,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
                                  elevation: 2,
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text("Dry Cleaning", style: TextStyle(fontSize: 17),),
                                )
                              ],
                            ),
                          ),
          
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context){
                                    return Drycleanscreen();
                                  }
                              )
                            );
                          },
                        ),
                      ],
                    ),
          
                    Column(
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          child: SizedBox(
                            height: 170,
                            width: 170,
          
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Material(
                                  child: Image.asset(
                                    'assets/images/laundry_basic_illustration.jpg',
                                    height: 130,
                                    width: 170,
                                    fit: BoxFit.fill,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
                                  elevation: 2,
                                ),
          
                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text("Premium Wash", style: TextStyle(fontSize: 17),),
                                )
                              ],
                            ),
                          ),
          
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context){
                                    return Premiumwashscreen();
                                  }
                              )
                            );
                          },
                        ),
          
                        SizedBox(height: 29,),
          
                        InkWell(
                          splashColor: Colors.transparent,
                          child: SizedBox(
                            height: 170,
                            width: 170,
          
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Material(
                                  child: Image.asset(
                                    'assets/images/laundry_basic_illustration.jpg',
                                    height: 130,
                                    width: 170,
                                    fit: BoxFit.fill,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
                                  elevation: 2,
                                ),
          
                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text("Ironing", style: TextStyle(fontSize: 17),),
                                )
                              ],
                            ),
                          ),
          
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context){
                                    return Ironscreen();
                                  }
                              )
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
          
                SizedBox(height: 35,),
                
                Text("In Progress", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          
                SizedBox(height: 15,),
          
                SizedBox(
                  height: 310,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
                          elevation: 3,
                          child: Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(21))
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(27.0),
                                      child: Icon(Icons.wash_rounded),
                                    ),

                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("8 Aug 2024", style: TextStyle(color: Colors.black38, fontSize: 15),),

                                        Text("Washing", style: TextStyle(fontSize: 20),),

                                        Text("15 items", style: TextStyle(color: Colors.black54, fontSize: 15))
                                      ],
                                    ),
                                  ],
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: Icon(Icons.navigate_next_rounded),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 7,);
                      },
                      itemCount: 7
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
