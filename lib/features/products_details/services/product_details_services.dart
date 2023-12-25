import 'dart:convert';

import 'package:amazon_clone_try/constants/error_handling.dart';
import 'package:amazon_clone_try/constants/global_variables.dart';
import 'package:amazon_clone_try/constants/utils.dart';
import 'package:amazon_clone_try/models/product.dart';
import 'package:amazon_clone_try/models/user.dart';
import 'package:amazon_clone_try/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ProductDetailsServices {
  void rateProduct(
      {required double rating,
      required Product product,
      required BuildContext context}) async {
    UserProvider userProvider = Provider.of(context, listen: false);
    try {
      Uri url = Uri.http(GloabalVariables.uri, '/rate-product');
      http.Response res = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token,
          },
          body: jsonEncode({
            'id': product.id,
            'rating': rating,
          }));

      httpErrorHandle(context: context, response: res, onSuccess: () {});
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  dynamic averageRating({required Product product}) {
    if (product.ratings == null || product.ratings!.isEmpty == true)
      return null;
    double rating = 0;
    for (int i = 0; i < product.ratings!.length; i++) {
      rating = rating + product.ratings![i].ratings;
    }
    rating = rating / product.ratings!.length;
    return rating;
  }

  void addToCart(
      {required Product product, required BuildContext context}) async {
    Uri url = Uri.http(GloabalVariables.uri, '/api/add-to-cart');
    UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        url,
        body: json.encode({'id': product.id}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandle(
          context: context,
          response: res,
          onSuccess: () {
            showSnackbar(context, 'product added to cart successfully!');
            User user =userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
            userProvider.setUserFromModel(user);
          });
    } catch (e) {
      showSnackbar(context, 'added to cart successfully!');
    }
  }
}
