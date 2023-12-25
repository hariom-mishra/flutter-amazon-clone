import 'dart:convert';

import 'package:amazon_clone_try/constants/error_handling.dart';
import 'package:amazon_clone_try/constants/utils.dart';
import 'package:amazon_clone_try/models/product.dart';
import 'package:amazon_clone_try/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SearchServices{
  Future<List<Product>> featchSearchProduct(
      {required BuildContext context, required String query}) async {
    final userProvider = Provider.of<UserProvider>(context);

    List<Product> productList = [];
    try {
      Uri url = Uri(
        scheme: 'http',
        host: 'IP',
        port: 3001,
        path: '/api/products/search',
        queryParameters: {
          'query': query,
        },
      );

      http.Response res = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });
      
      httpErrorHandle(
          context: context,
          response: res,
          onSuccess: () {
            final resProduct = jsonDecode(res.body);
            for (int i = 0; i < resProduct.length; i++) {
              productList.add(
                Product.fromJson(
                  jsonEncode(resProduct[i]),
                ),
              );
            }
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
    return productList;
  }
}