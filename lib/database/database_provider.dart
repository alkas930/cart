import 'package:add_to_cart/model/cart_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  static final DatabaseProvider _instance = DatabaseProvider._();
  static Database? _database;

  DatabaseProvider._();

  factory DatabaseProvider() {
    return _instance;
  }

  Future<Database> get database async {
    if (database != null) return database!;
    _database = await _initDB('cart.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cartItems (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        quantity INTEGER,
        price REAL
      )
    ''');
  }

  Future<void> addToCart(CartItem cartItem) async {
    final db = await database;
    await db.insert('cartItems', cartItem.toMap());
  }

  Future<List<CartItem>> getCartItems() async {
    final db = await database;
    final result = await db.query('cartItems');

    return result.map((json) => CartItem.fromMap(json)).toList();
  }

  Future<void> updateCartItem(CartItem cartItem) async {
    final db = await database;
    await db.update(
      'cartItems',
      cartItem.toMap(),
      where: 'id = ?',
      whereArgs: [cartItem.id],
    );
  }

  Future<void> removeCartItem(int id) async {
    final db = await database;
    await db.delete(
      'cartItems',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> clearCart() async {
    final db = await database;
    await db.delete('cartItems');
  }
}
