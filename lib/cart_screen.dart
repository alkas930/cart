import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartScreen extends StatefulWidget {
  final String productName;
  final double price;
  final String picture;
  final String description;
  int quantity;
  CartScreen({
    super.key,
    required this.productName,
    required this.price,
    required this.picture,
    required this.description,
    required this.quantity,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 155, 207),
        title: Text("Cart Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Container(
            child: Center(
              child: Image.asset(
                widget.picture,
                scale: 0.6,
              ),
            ),
          ),
          Center(
            child: Text(
              widget.description,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Divider(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Row(
              //   children: [
              //     IconButton(
              //       onPressed: () {
              //         setState(() {
              //           if (widget.quantity > 1) {
              //             widget.quantity--;
              //           }
              //         });
              //       },
              //       icon: Icon(Icons.remove),
              //     ),
              //     Text(widget.quantity.toString()),
              //     IconButton(
              //       onPressed: () {
              //         setState(() {
              //           widget.quantity++;
              //         });
              //       },
              //       icon: const Icon(Icons.add),
              //     ),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "75 % off",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 5, 170, 60)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "₹",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.price.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              Row(
                children: [
                  Text(
                    "Quantity ▶ ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromARGB(255, 51, 50, 50))),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (widget.quantity > 1) {
                                widget.quantity--;
                              }
                            });
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Text(widget.quantity.toString()),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.quantity++;
                            });
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
              onTap: () {},
              child: Container(
                height: 30,
                width: 120,
                child: Center(
                  child: Text(
                    "Buy now",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(5),
                ),
              )),
        ]),
      ),
    );
  }
}
