import 'dart:convert';

import 'package:amazon_clone_try/common/widget/bottom_bar.dart';
import 'package:amazon_clone_try/constants/global_variables.dart';
import 'package:amazon_clone_try/constants/error_handling.dart';
import 'package:amazon_clone_try/constants/utils.dart';
import 'package:amazon_clone_try/features/home/screens/home_screen.dart';
import 'package:amazon_clone_try/models/user.dart';
import 'package:amazon_clone_try/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signup({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      User user = User(
        id: '',
        email: email,
        name: name,
        password: password,
        address: '',
        type: '',
        token: '',
        cart: []
      );
      var url = Uri.http(GloabalVariables.uri, '/api/signup');
      http.Response res = await http.post(url,
          body: json.encode(user.toJson()),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackbar(context,
                'account has been created, log in with the same credential');
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  void signIn(
      {required String password,
      required String email,
      required BuildContext context}) async {
    try {
      var url = Uri.http(GloabalVariables.uri, '/api/signin');
      http.Response res = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httpErrorHandle(
          context: context,
          response: res,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);

            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            Navigator.of(context).pushNamed(BottomBar.routeName);
            showSnackbar(context, 'logged in');
          });
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  void getUserData(BuildContext context) async {
    
    try {
      var url = Uri.http(GloabalVariables.uri, '/tokenIsValid');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(url, headers: <String, String>{
        'Content-Type': 'application/json; charset:UTF-8',
        'x-auth-token': token!
      });
      var response = jsonDecode(tokenRes.body);
      var userDataUrl = Uri.http(GloabalVariables.uri, '/');
      
      if (response == true) {
        http.Response userResponse = await http.get(userDataUrl,
            headers: <String, String>{
              'Content-Type': 'application/json; charset:UTF-8',
              'x-auth-token': token
            });
            var userProvider = Provider.of<UserProvider>(context, listen: false);
            userProvider.setUser(userResponse.body);
      }
      
    } catch (e) {
      
    }
  }
}
