// class Product {
//   final int id;
//   final String title;
//   final double price;
//   final int quantity;
//   final String image;
//   final String description;

//   Product({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.quantity,
//     required this.image,
//     required this.description,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       title: json['title'],
//       price: json['price'].toDouble(),
//       quantity: json['quantity'],
//       image: json['image'],
//       description: json['des'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'price': price,
//       'quantity': quantity,
//       'image': image,
//       'des': description,
//     };
//   }
// }

class CartItem {
  int? id;
  final String name;
  int quantity;
  final double price;
  final String image;
  final String des;

  CartItem({
    this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
    required this.des,
  });

  // Extract a CartItem object from a Map.
  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
        id: map['id'],
        name: map['name'],
        quantity: map['quantity'],
        price: map['price'],
        des: map['des'],
        image: map['image']);
  }

  // Convert a CartItem into a Map. The keys must correspond to the names of the columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
      'des': des,
      "image": image
    };
  }
}
