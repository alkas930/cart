import 'package:add_to_cart/database/database_provider.dart';
import 'package:flutter/material.dart';

import '../model/cart_model.dart';

class CartProvider with ChangeNotifier {
  final DatabaseProvider _databaseProvider = DatabaseProvider();

  final Map<String, CartItem> _cartItems = {};

  final List<Map<String, dynamic>> products = [
    {
      "id": 1,
      "title": "Bag",
      "price": 50.00,
      "quantity": 1,
      "image": "assets/bag.jpg",
      "des":
          "jir fashion Office Casual College Backpack School Bag For Men and Women Waterproof Backpack  (Brown, 30 L)"
    },
    {
      "id": 2,
      "title": "Chair",
      "price": 150.00,
      "quantity": 1,
      "image": "assets/chair.jpg",
      "des":
          "GEcreation Metal Living Room Chair  (Finish Color - Black, Pre-assembled)"
    },
    {
      "id": 3,
      "title": "phone",
      "price": 1550.00,
      "quantity": 1,
      "image": "assets/phone.jpg",
      "des":
          "OnePlus Nord 3 5G 128 GB 8 GB RAM Misty Green, Mobile Phone(493838380)"
    },
    {
      "id": 4,
      "title": "shoes",
      "price": 550.00,
      "quantity": 1,
      "image": "assets/shoes2.jpg",
      "des": "FAST-FWD NITRO™ Elite Men's Running Shoes"
    }
  ];

  CartProvider() {
    _loadCartItems();
  }

  Map<String, CartItem> get cartItems => _cartItems;

  Future<void> _loadCartItems() async {
    final cartItems = await _databaseProvider.getCartItems();
    for (var cartItem in cartItems) {
      _cartItems[cartItem.name] = cartItem;
    }
    notifyListeners();
  }

  Future<void> addToCart(String itemName, int quantity, double price,
      String image, String des, BuildContext context) async {
    if (_cartItems.containsKey(itemName)) {
      _cartItems[itemName]!.quantity += quantity;
      await _databaseProvider.updateCartItem(_cartItems[itemName]!);
    } else {
      final cartItem = CartItem(
          name: itemName,
          quantity: quantity,
          price: price,
          image: image,
          des: des);
      await _databaseProvider.addToCart(cartItem);
      _cartItems[itemName] = cartItem;
    }
    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$quantity added to cart'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> updateQuantity(String item, int quantity) async {
    if (_cartItems.containsKey(item)) {
      _cartItems[item]!.quantity = quantity;
      await _databaseProvider.updateCartItem(_cartItems[item]!);
      notifyListeners();
    }
  }

  Future<void> removeFromCart(String item) async {
    if (_cartItems.containsKey(item)) {
      final cartItem = _cartItems[item]!;
      if (cartItem.id != null) {
        await _databaseProvider.removeCartItem(cartItem.id!);
      }
      _cartItems.remove(item);
      notifyListeners();
    }
  }

  Future<void> clearCart() async {
    await _databaseProvider.clearCart();
    _cartItems.clear();
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }
}
