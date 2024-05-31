import 'package:add_to_cart/cart_screen.dart';
import 'package:add_to_cart/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 184, 220),
        title: const Text('Product Screen'),
        actions: [
          Stack(children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),
            Positioned(
              left: 16,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: Color.fromARGB(255, 226, 101, 70),
                foregroundColor: Colors.white,
                child: Text(
                  "4",
                  style: TextStyle(fontSize: 10),
                ),
              ),
            )
          ])
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (_, cartProvider, __) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: cartProvider.products.length,
              itemBuilder: (BuildContext context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: Image.asset(
                        cartProvider.products[index]['image'],
                        // scale: 2,
                      ),
                      title: Text(cartProvider.products[index]['title']),
                      titleTextStyle: const TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(115, 19, 18, 18),
                          fontWeight: FontWeight.bold),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${cartProvider.products[index]["des"]}  \n\n Price : ₹ ${cartProvider.products[index]['price'].toString()}"),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text("item added to cart"),
                            action: SnackBarAction(
                                label: "click here",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CartScreen(),
                                    ),
                                  );
                                }),
                          ));
                        },
                        child: const Text('add to cart '),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 100,
                            height: 37,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 252, 251, 249),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 51, 50, 50))),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (cartProvider.products[index]
                                              ['quantity'] >
                                          1) {
                                        cartProvider.products[index]
                                            ['quantity']--;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                Text(cartProvider.products[index]['quantity']
                                    .toString()),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      cartProvider.products[index]
                                          ['quantity']++;
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 35,
                                width: 100,
                                child: const Center(
                                  child: Text(
                                    "Buy now",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
