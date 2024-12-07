import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app/main.dart';

class Checkoutscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Checkout", style: TextStyle(fontWeight: FontWeight.w900),),
        centerTitle: true,
      ),

      body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
                padding: const EdgeInsets.all(27),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
                    elevation: 3,
                    child: Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width,

                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(21))
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("Address", style: TextStyle(fontSize: 20),),

                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur... ",
                                  style: TextStyle(color: Colors.black38, fontSize: 15),)

                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.all(11.0),
                            child: Icon(Icons.navigate_next_rounded),
                          )
                        ],
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 35,),
                  
                  Text(
                      "Pick up",
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),

                  SizedBox(height: 11,),

                  SizedBox(
                    height: 100,
                    child: Center(
                      child: ListView.separated(

                        scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 2,
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(21)
                              ),
                              child: Container(
                                height: 80,
                                width: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Text("Today", style: TextStyle(fontSize: 19),),

                                    Text("at 9am")
                                  ],
                                ),

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(21)
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 20,);
                          },
                          itemCount: 9
                      ),
                    ),
                  ),

                  SizedBox(height: 35,),

                  Text(
                    "Delivery",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),

                  SizedBox(height: 11,),

                  SizedBox(
                    height: 100,
                    child: Center(
                      child: ListView.separated(

                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 2,
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(21)
                              ),
                              child: Container(
                                height: 80,
                                width: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Text("${5 - index} days", style: TextStyle(fontSize: 19),),

                                    Text("No extras")
                                  ],
                                ),

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(21)
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 20,);
                          },
                          itemCount: 5
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      )
    );
  }
}
