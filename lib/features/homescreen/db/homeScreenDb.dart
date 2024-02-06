import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wac_test/features/homescreen/modal/productContent.dart';

import '../modal/categories.dart';

class HomeScreenDb {
  late Database _database;

  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'example.db'),
      onCreate: (db, version) async {
        await db
            .execute(
              'CREATE TABLE mostPopularProducts(sku TEXT PRIMARY KEY, product_name TEXT, product_image TEXT, product_rating INTEGER, actual_price TEXT, offer_price TEXT, discount TEXT)',
            )
            .then((value) => print('created'));
        await db
            .execute(
              'CREATE TABLE bestSellerProducts(sku TEXT PRIMARY KEY, product_name TEXT, product_image TEXT, product_rating INTEGER, actual_price TEXT, offer_price TEXT, discount TEXT)',
            )
            .then((value) => print('created'));
        await db
            .execute(
              'CREATE TABLE categories(id TEXT PRIMARY KEY, type TEXT, title TEXT)',
            )
            .then((value) => print('created'));
      },
      version: 1,
    );
  }

  Future<void> insertMostPopularProducts(ProductContent product) async {
    await _database
        .insert(
          'mostPopularProducts',
          product.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        )
        .then((value) => print('inserted'));
  }

  Future<void> insertBestSellerProducts(ProductContent product) async {
    await _database
        .insert(
          'bestSellerProducts',
          product.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        )
        .then((value) => print('inserted'));
  }

  Future<List<ProductContent>> retrieveMostPopularProducts() async {
    final List<Map<String, dynamic>> maps =
        await _database.query('mostPopularProducts');
    return List.generate(maps.length, (index) {
      return ProductContent.fromJson(maps[index]);
    });
  }

  Future<List<ProductContent>> retrieveBestSellerProducts() async {
    final List<Map<String, dynamic>> maps =
        await _database.query('bestSellerProducts');
    return List.generate(maps.length, (index) {
      return ProductContent.fromJson(maps[index]);
    });
  }

  Future<void> insertCategory(Categories category) async {
    await _database.insert(
      'categories',
      category.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Categories>> retrieveCategories() async {
    final List<Map<String, dynamic>> maps = await _database.query('categories');
    return List.generate(maps.length, (index) {
      return Categories.fromJson(maps[index]);
    });
  }
}
