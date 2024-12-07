import 'checkoutScreen.dart';
import 'main.dart';
import 'package:flutter/material.dart';

class Ironscreen extends StatefulWidget{
  static const routeName = '/is';
  @override
  State<Ironscreen> createState() => _IronscreenState();
}

class _IronscreenState extends State<Ironscreen> {
  List<String> bottomItemName = [
    "Item 1",
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8'
  ];

  List<int> bottomQuantities = [1, 1, 1, 1, 1, 1, 1, 1];

  List<double> bottomPrices = [30, 20, 15, 25, 30, 15, 35, 40];

  List<String> topsItemName = [
    "Item 1",
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8'
  ];

  List<int> topsQuantities = [1, 1, 1, 1, 1, 1, 1, 1];

  List<double> topsPrices = [30, 20, 15, 25, 30, 35, 15, 40];

  List<String> coatItemName = [
    "Item 1",
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8'
  ];

  List<int> coatQuantities = [1, 1, 1, 1, 1, 1, 1, 1];

  List<double> coatPrices = [30, 20, 15, 25, 30, 10, 20, 40];

  List<String> dressItemName = [
    "Item 1",
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8'
  ];

  List<int> dressQuantities = [1, 1, 1, 1, 1, 1, 1, 1];

  List<double> dressPrices = [30, 20, 15, 25, 30, 10, 15, 40];

  void bottomIncrementQty(int index){
    setState(() {
      bottomQuantities[index]++;
    });
  }

  void bottomDecrementQty(int index){
    setState(() {
      if(bottomQuantities[index] > 0){
        bottomQuantities[index]--;
      }
    });
  }

  void topsIncrementQty(int index){
    setState(() {
      topsQuantities[index]++;
    });
  }

  void topsDecrementQty(int index){
    setState(() {
      if(topsQuantities[index] > 0){
        topsQuantities[index]--;
      }
    });
  }

  void coatIncrementQty(int index){
    setState(() {
      coatQuantities[index]++;
    });
  }

  void coatDecrementQty(int index){
    setState(() {
      if(coatQuantities[index] > 0){
        coatQuantities[index]--;
      }
    });
  }

  void dressIncrementQty(int index){
    setState(() {
      dressQuantities[index]++;
    });
  }

  void dressDecrementQty(int index){
    setState(() {
      if(dressQuantities[index] > 0){
        dressQuantities[index]--;
      }
    });
  }

  double getCartTotal(){
    double total = 0;
    double bottomTotal = 0;
    double topsTotal = 0;
    double coatTotal = 0;
    double dressTotal = 0;

    for(int i = 0; i < bottomItemName.length; i++){
      bottomTotal += (bottomQuantities[i] * bottomPrices[i]) ;
    }

    for(int i = 0; i < topsItemName.length; i++){
      topsTotal += (topsQuantities[i] * topsPrices[i]) ;
    }

    for(int i = 0; i < coatItemName.length; i++){
      coatTotal += (coatQuantities[i] * coatPrices[i]) ;
    }

    for(int i = 0; i < dressItemName.length; i++){
      dressTotal += (dressQuantities[i] * dressPrices[i]) ;
    }

    total = bottomTotal + topsTotal + coatTotal + dressTotal;

    return total;
  }

  void showDialogBoxOnProceed(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: const Text("'Unable to Proceed"),
            content: const Text("Nothing in Cart!"),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok")
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(

        appBar: AppBar(
          title: Text('Ironing'),
          centerTitle: true,

          bottom: TabBar(
            overlayColor: WidgetStateColor.transparent,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 7
                ),

                borderRadius: BorderRadius.circular(3.5)
            ),

            labelPadding: EdgeInsets.symmetric(horizontal: 27),

            tabs: [
              Tab(
                child: Text("Bottoms"),
              ),
              Tab(
                child: Text("Tops"),
              ),
              Tab(
                child: Text("Coats"),
              ),
              Tab(
                child: Text("Dresses"),
              )
            ],
          ),
        ),

        body: SafeArea(
            child: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(27),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 7,
                                );
                              },
                              itemCount: bottomItemName.length,
                              itemBuilder: ((context, index){
                                return Dismissible(
                                  key: Key(bottomItemName[index]),
                                  direction: DismissDirection.endToStart,
                                  onDismissed: (direction){
                                    setState(() {
                                      bottomItemName.removeAt(index);
                                    });
                                  },
                                  background: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(21),
                                    ),
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.only(right: 16),
                                    child: const Icon(
                                      Icons.cancel_rounded,
                                      color: Colors.white,
                                    ),
                                  ),

                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
                                    elevation: 2,
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.only(
                                              right: 16,
                                              top: 5
                                          ),
                                          margin: const EdgeInsets.only(
                                            // left: 2,
                                            // right: 2,
                                              bottom: 2
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(21),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [

                                                Container(
                                                  margin: const EdgeInsets.only(bottom: 7),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        bottomItemName[index],
                                                        style: const TextStyle(fontSize: 18),
                                                      ),
                                                      Text(
                                                        '\u{20B9}' + bottomPrices[index].toString(),
                                                        style: TextStyle(
                                                            fontSize: 16
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),

                                                const Spacer(),

                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 34,
                                                      width: 34,
                                                      decoration: BoxDecoration(
                                                          borderRadius: const BorderRadius.only(
                                                              topLeft: Radius.circular(7),
                                                              bottomLeft: Radius.circular(7)
                                                          ),
                                                          border: Border.all(
                                                              width: 0.1,
                                                              color: Colors.grey
                                                          )
                                                      ),

                                                      child: Center(
                                                        child: IconButton(
                                                          padding: EdgeInsets.zero,
                                                          onPressed: (){
                                                            bottomDecrementQty(index);

                                                            if(bottomQuantities[index] == 0){
                                                              setState(() {
                                                                bottomQuantities.removeAt(index);
                                                                bottomItemName.removeAt(index);
                                                                bottomPrices.removeAt(index);
                                                              });
                                                            }
                                                          },
                                                          icon: const Icon(Icons.remove),
                                                        ),
                                                      ),
                                                    ),

                                                    Container(
                                                      height: 34,
                                                      width: 34,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 0.1,
                                                              color: Colors.grey
                                                          )
                                                      ),

                                                      child: Center(
                                                        child: Text(
                                                          bottomQuantities[index].toString(),
                                                          style: const TextStyle(
                                                              fontSize: 18
                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    Container(
                                                      height: 34,
                                                      width: 34,
                                                      decoration: BoxDecoration(
                                                          borderRadius: const BorderRadius.only(
                                                              topRight: Radius.circular(7),
                                                              bottomRight: Radius.circular(7)
                                                          ),
                                                          border: Border.all(
                                                              width: 0.1,
                                                              color: Colors.grey
                                                          )
                                                      ),

                                                      child: Center(
                                                        child: IconButton(
                                                          padding: EdgeInsets.zero,
                                                          onPressed: (){
                                                            bottomIncrementQty(index);
                                                          },
                                                          icon: const Icon(Icons.add),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                );
                              }
                              )
                          )
                      ),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(27),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 7,
                                );
                              },
                              itemCount: topsItemName.length,
                              itemBuilder: ((context, index){
                                return Dismissible(
                                  key: Key(topsItemName[index]),
                                  direction: DismissDirection.endToStart,
                                  onDismissed: (direction){
                                    setState(() {
                                      topsItemName.removeAt(index);
                                    });
                                  },
                                  background: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(21),
                                    ),
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.only(right: 16),
                                    child: const Icon(
                                      Icons.cancel_rounded,
                                      color: Colors.white,
                                    ),
                                  ),

                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
                                    elevation: 2,
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.only(
                                              right: 16,
                                              top: 5
                                          ),
                                          margin: const EdgeInsets.only(
                                            // left: 15,
                                            // right: 15,
                                              bottom: 2
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(21),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [

                                                Container(
                                                  margin: const EdgeInsets.only(bottom: 7),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        topsItemName[index],
                                                        style: const TextStyle(fontSize: 18),
                                                      ),

                                                      Text(
                                                        '\u{20B9}' + topsPrices[index].toString(),
                                                        style: TextStyle(
                                                            fontSize: 16
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),

                                                const Spacer(),

                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 34,
                                                      width: 34,
                                                      decoration: BoxDecoration(
                                                          borderRadius: const BorderRadius.only(
                                                              topLeft: Radius.circular(7),
                                                              bottomLeft: Radius.circular(7)
                                                          ),
                                                          border: Border.all(
                                                              width: 0.1,
                                                              color: Colors.grey
                                                          )
                                                      ),

                                                      child: Center(
                                                        child: IconButton(
                                                          padding: EdgeInsets.zero,
                                                          onPressed: (){
                                                            topsDecrementQty(index);

                                                            if(topsQuantities[index] == 0){
                                                              setState(() {
                                                                topsQuantities.removeAt(index);
                                                                topsItemName.removeAt(index);
                                                                topsPrices.removeAt(index);
                                                              });
                                                            }
                                                          },
                                                          icon: const Icon(Icons.remove),
                                                        ),
                                                      ),
                                                    ),

                                                    Container(
                                                      height: 34,
                                                      width: 34,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 0.1,
                                                              color: Colors.grey
                                                          )
                                                      ),

                                                      child: Center(
                                                        child: Text(
                                                          topsQuantities[index].toString(),
                                                          style: const TextStyle(
                                                              fontSize: 18
                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    Container(
                                                      height: 34,
                                                      width: 34,
                                                      decoration: BoxDecoration(
                                                          borderRadius: const BorderRadius.only(
                                                              topLeft: Radius.circular(7),
                                                              bottomLeft: Radius.circular(7)
                                                          ),
                                                          border: Border.all(
                                                              width: 0.1,
                                                              color: Colors.grey
                                                          )
                                                      ),

                                                      child: Center(
                                                        child: IconButton(
                                                          padding: EdgeInsets.zero,
                                                          onPressed: (){
                                                            topsIncrementQty(index);
                                                          },
                                                          icon: const Icon(Icons.add),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              )
                          )
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(27),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 7,
                                );
                              },
                              itemCount: coatItemName.length,
                              itemBuilder: ((context, index){
                                return Dismissible(
                                  key: Key(coatItemName[index]),
                                  direction: DismissDirection.endToStart,
                                  onDismissed: (direction){
                                    setState(() {
                                      coatItemName.removeAt(index);
                                    });
                                  },
                                  background: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(21),
                                    ),
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.only(right: 16),
                                    child: const Icon(
                                      Icons.cancel_rounded,
                                      color: Colors.white,
                                    ),
                                  ),

                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
                                    elevation: 2,
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.only(
                                              right: 16,
                                              top: 5
                                          ),
                                          margin: const EdgeInsets.only(
                                            // left: 2,
                                            // right: 2,
                                              bottom: 2
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(21),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [

                                                Container(
                                                  margin: const EdgeInsets.only(bottom: 7),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        coatItemName[index],
                                                        style: const TextStyle(fontSize: 18),
                                                      ),
                                                      Text(
                                                        '\u{20B9}' + coatPrices[index].toString(),
                                                        style: TextStyle(
                                                            fontSize: 16
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),

                                                const Spacer(),

                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 34,
                                                      width: 34,
                                                      decoration: BoxDecoration(
                                                          borderRadius: const BorderRadius.only(
                                                              topLeft: Radius.circular(7),
                                                              bottomLeft: Radius.circular(7)
                                                          ),
                                                          border: Border.all(
                                                              width: 0.1,
                                                              color: Colors.grey
                                                          )
                                                      ),

                                                      child: Center(
                                                        child: IconButton(
                                                          padding: EdgeInsets.zero,
                                                          onPressed: (){
                                                            coatDecrementQty(index);

                                                            if(coatQuantities[index] == 0){
                                                              setState(() {
                                                                coatQuantities.removeAt(index);
                                                                coatItemName.removeAt(index);
                                                                coatPrices.removeAt(index);
                                                              });
                                                            }
                                                          },
                                                          icon: const Icon(Icons.remove),
                                                        ),
                                                      ),
                                                    ),

                                                    Container(
                                                      height: 34,
                                                      width: 34,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 0.1,
                                                              color: Colors.grey
                                                          )
                                                      ),

                                                      child: Center(
                                                        child: Text(
                                                          coatQuantities[index].toString(),
                                                          style: const TextStyle(
                                                              fontSize: 18
                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    Container(
                                                      height: 34,
                                                      width: 34,
                                                      decoration: BoxDecoration(
                                                          borderRadius: const BorderRadius.only(
                                                              topRight: Radius.circular(7),
                                                              bottomRight: Radius.circular(7)
                                                          ),
                                                          border: Border.all(
                                                              width: 0.1,
                                                              color: Colors.grey
                                                          )
                                                      ),

                                                      child: Center(
                                                        child: IconButton(
                                                          padding: EdgeInsets.zero,
                                                          onPressed: (){
                                                            coatIncrementQty(index);
                                                          },
                                                          icon: const Icon(Icons.add),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              )
                          )
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(27),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 7,
                                );
                              },
                              itemCount: dressItemName.length,
                              itemBuilder: ((context, index){
                                return Dismissible(
                                  key: Key(dressItemName[index]),
                                  direction: DismissDirection.endToStart,
                                  onDismissed: (direction){
                                    setState(() {
                                      dressItemName.removeAt(index);
                                    });
                                  },
                                  background: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(21),
                                    ),
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.only(right: 16),
                                    child: const Icon(
                                      Icons.cancel_rounded,
                                      color: Colors.white,
                                    ),
                                  ),

                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
                                    elevation: 2,
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.only(
                                              right: 16,
                                              top: 5
                                          ),
                                          margin: const EdgeInsets.only(
                                            // left: 15,
                                            // right: 15,
                                              bottom: 2
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(21),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [

                                                Container(
                                                  margin: const EdgeInsets.only(bottom: 7),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        dressItemName[index],
                                                        style: const TextStyle(fontSize: 18),
                                                      ),

                                                      Text(
                                                        '\u{20B9}' + dressPrices[index].toString(),
                                                        style: TextStyle(
                                                            fontSize: 16
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),

                                                const Spacer(),

                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 34,
                                                      width: 34,
                                                      decoration: BoxDecoration(
                                                          borderRadius: const BorderRadius.only(
                                                              topLeft: Radius.circular(7),
                                                              bottomLeft: Radius.circular(7)
                                                          ),
                                                          border: Border.all(
                                                              width: 0.1,
                                                              color: Colors.grey
                                                          )
                                                      ),

                                                      child: Center(
                                                        child: IconButton(
                                                          padding: EdgeInsets.zero,
                                                          onPressed: (){
                                                            dressDecrementQty(index);

                                                            if(dressQuantities[index] == 0){
                                                              setState(() {
                                                                dressQuantities.removeAt(index);
                                                                dressItemName.removeAt(index);
                                                                dressPrices.removeAt(index);
                                                              });
                                                            }
                                                          },
                                                          icon: const Icon(Icons.remove),
                                                        ),
                                                      ),
                                                    ),

                                                    Container(
                                                      height: 34,
                                                      width: 34,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 0.1,
                                                              color: Colors.grey
                                                          )
                                                      ),

                                                      child: Center(
                                                        child: Text(
                                                          dressQuantities[index].toString(),
                                                          style: const TextStyle(
                                                              fontSize: 18
                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    Container(
                                                      height: 34,
                                                      width: 34,
                                                      decoration: BoxDecoration(
                                                          borderRadius: const BorderRadius.only(
                                                              topLeft: Radius.circular(7),
                                                              bottomLeft: Radius.circular(7)
                                                          ),
                                                          border: Border.all(
                                                              width: 0.1,
                                                              color: Colors.grey
                                                          )
                                                      ),

                                                      child: Center(
                                                        child: IconButton(
                                                          padding: EdgeInsets.zero,
                                                          onPressed: (){
                                                            dressIncrementQty(index);
                                                          },
                                                          icon: const Icon(Icons.add),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              )
                          )
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),

        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(21), topRight: Radius.circular(21)),
          child: BottomAppBar(
            height: (MediaQuery.of(context).size.height) * 0.125,
            elevation: 21,
            shadowColor: Colors.black12,

            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(21), topRight: Radius.circular(21))
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Cart Total',
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),

                        const SizedBox(
                          width: 50,
                        ),

                        Text(
                          '\u{20B9}' + getCartTotal().toStringAsFixed(2),
                          style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    ElevatedButton(
                        onPressed: (){
                          if(getCartTotal() != 0){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context){
                                      return Checkoutscreen();
                                    }
                                )
                            );
                          }
                          else{
                            showDialogBoxOnProceed();
                          }
                        },

                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(21)
                            )
                        ),
                        child: const Text(
                          "Proceed to Checkout",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17
                          ),
                        )
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
