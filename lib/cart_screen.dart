import 'package:add_to_cart/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Screen'),
      ),
      body: Consumer<CartProvider>(
        builder: (_, cartProvider, __) {
          if (cartProvider.cartItems.isEmpty) {
            return const Center(child: Text('No items in the cart.'));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartProvider.cartItems.length,
                  itemBuilder: (context, index) {
                    String itemName =
                        cartProvider.cartItems.keys.elementAt(index);
                    CartItem cartItem = cartProvider.cartItems[itemName]!;
                    return ListTile(
                      title: Row(
                        children: [
                          Text(cartItem.name),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('Price: \$${cartItem.price.toStringAsFixed(2)}'),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              if (cartItem.quantity > 1) {
                                cartProvider.updateQuantity(
                                    itemName, cartItem.quantity - 1);
                              }
                            },
                          ),
                          Text('${cartItem.quantity}'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              cartProvider.updateQuantity(
                                  itemName, cartItem.quantity + 1);
                            },
                          ),
                        ],
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Text(
                          //     'Total: \$${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}'),
                          IconButton(
                            icon: const Icon(Icons.remove_shopping_cart),
                            onPressed: () {
                              cartProvider.removeFromCart(itemName);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Total Price: \$${cartProvider.getTotalPrice().toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
