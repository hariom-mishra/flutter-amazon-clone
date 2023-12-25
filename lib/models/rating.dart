import 'dart:convert';

class ProductRating{
  final String userId;
  final int ratings;

  ProductRating({required this.userId, required this.ratings});

  Map<String, dynamic> toMap(){
    return{
      'userId': userId,
      'ratings': ratings,
    };
  }

  factory ProductRating.fromMap(Map<String, dynamic> map){
    return ProductRating(userId: map['userId'] ?? '',
     ratings: map['ratings'] ?? 0,
     );
  }

  factory ProductRating.fromJson(String source) => ProductRating.fromJson(json.decode(source));
  String toJson()=>json.encode(toMap());
}