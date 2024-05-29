import 'package:add_to_cart/cart_screen.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<Map<String, dynamic>> products = [
    {
      "title": "Bag",
      "price": 50.00,
      "quantity": 1,
      "image": "assets/bag.jpg",
      "des":
          "jir fashion Office Casual College Backpack School Bag For Men and Women Waterproof Backpack  (Brown, 30 L)"
    },
    {
      "title": "Chair",
      "price": 150.00,
      "quantity": 1,
      "image": "assets/chair.jpg",
      "des":
          "GEcreation Metal Living Room Chair  (Finish Color - Black, Pre-assembled)"
    },
    {
      "title": "phone",
      "price": 1550.00,
      "quantity": 1,
      "image": "assets/phone.jpg",
      "des":
          "OnePlus Nord 3 5G 128 GB 8 GB RAM Misty Green, Mobile Phone(493838380)"
    },
    {
      "title": "shoes",
      "price": 550.00,
      "quantity": 1,
      "image": "assets/shoes2.jpg",
      "des": "FAST-FWD NITRO™ Elite Men's Running Shoes"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 243, 184, 220),
        title: const Text('Product Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, index) {
            return Column(
              children: [
                ListTile(
                  leading: Image.asset(
                    products[index]['image'],
                    // scale: 2,
                  ),
                  title: Text(products[index]['title']),
                  titleTextStyle: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(115, 41, 40, 40),
                      fontWeight: FontWeight.bold),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "${products[index]["des"]}  \n\n Price : ₹ ${products[index]['price'].toString()}"),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(
                            productName: products[index]['title'],
                            price: products[index]['price'],
                            picture: products[index]['image'],
                            description: products[index]["des"],
                            quantity: products[index]['quantity'],
                          ),
                        ),
                      );
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
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromARGB(255, 51, 50, 50))),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (products[index]['quantity'] > 1) {
                                    products[index]['quantity']--;
                                  }
                                });
                              },
                              icon: Icon(Icons.remove),
                            ),
                            Text(products[index]['quantity'].toString()),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  products[index]['quantity']++;
                                });
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            width: 100,
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
                    ],
                  ),
                ),
                const Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
