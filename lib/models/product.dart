import 'dart:convert';

import 'package:amazon_clone_try/models/rating.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final int quantity;
  final String category;
  final List<String> imgUrls;
  final String? id;
  final String? userId;
  final List<ProductRating>? ratings;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.category,
    required this.imgUrls,
    this.id,
    this.userId,
    this.ratings
  });
 

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'category': category,
      'imgUrls': imgUrls,
      '_id': id,
      'userId': userId,
      'ratings':ratings,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        name: map['name'] ?? '',
        description: map['description'] ?? '',
        quantity: map['quantity'] ?? '',
        imgUrls: List<String>.from(map['imgUrls']),
        id: map['_id'],
        userId: map['userId'],
        price: map['price']?.toDouble() ?? 0.0,
        category: map['category'] ?? '',
        ratings: map['ratings']!=null ? List<ProductRating>.from(map['ratings']?.map((x)=>ProductRating.fromMap(x))) : null,
        );
        
  }

  String toJson() => json.encode(toMap());
  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
