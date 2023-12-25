import 'dart:convert';
import 'dart:io';

import 'package:amazon_clone_try/constants/error_handling.dart';
import 'package:amazon_clone_try/constants/global_variables.dart';
import 'package:amazon_clone_try/constants/utils.dart';
import 'package:amazon_clone_try/models/product.dart';
import 'package:amazon_clone_try/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminService {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required String category,
    required double price,
    required int quantity,
    required List<File> images,
  }) async {
    
    try {
      final cloudinary = CloudinaryPublic('dzevoibvs', 'kh3cusa6');
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse cloudinaryResponse = await cloudinary
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));

        imageUrls.add(cloudinaryResponse.secureUrl);
      }
      
      Product product = Product(
          name: name,
          description: description,
          price: price,
          quantity: quantity,
          category: category,
          imgUrls: imageUrls);

      final url = Uri.http(GloabalVariables.uri, '/admin/add-product');
      

      http.Response res = await http
          .post(url, body: product.toJson(), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });
      print(res);
      httpErrorHandle(
          context: context,
          response: res,
          onSuccess: () {
            showSnackbar(context, 'Product added successfully');
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  Future<List<Product>> featchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      final url = Uri.http(GloabalVariables.uri, '/admin/all-products');
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

  deleteProduct({required String id, required BuildContext context})async{
    final url = Uri.http(GloabalVariables.uri, '/admin/delete-product',);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.delete(url, 
        body: json.encode({
          'id':id
        }),
        headers: <String, String>{
          'Content-Type':'application/json; charset=UTF-8',
          'x-auth-token':userProvider.user.token,
        }
      );

      httpErrorHandle(context: context, response: res, onSuccess: (){
        showSnackbar(context, 'product deleted successfully.');
      });

    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
