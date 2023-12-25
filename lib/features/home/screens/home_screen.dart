import 'dart:convert';

import 'package:amazon_clone_try/constants/global_variables.dart';
import 'package:amazon_clone_try/features/home/widgets/address_box.dart';
import 'package:amazon_clone_try/features/home/widgets/carousal__image.dart';
import 'package:amazon_clone_try/features/home/widgets/deal_of_day.dart';
import 'package:amazon_clone_try/features/home/widgets/top_categories.dart';
import 'package:amazon_clone_try/features/search/screens/search_screen.dart';
import 'package:amazon_clone_try/models/user.dart';
import 'package:amazon_clone_try/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    void navigateToSearchScreen(String query) {
      Navigator.of(context).pushNamed(SearchScreen.routeName, arguments: query);
    }

    User user = Provider.of<UserProvider>(context, listen: false).user;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            flexibleSpace: Container(
                padding: const EdgeInsets.only(
                    top: 10, left: 15, right: 5, bottom: 5),
                decoration:
                    BoxDecoration(gradient: GloabalVariables.appBarGradient),
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: TextFormField(
                            
                            onFieldSubmitted: navigateToSearchScreen,
                           
                            decoration: InputDecoration(
                              
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.all(5),
                              hintText: 'Search Amazon.in',
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              suffixIcon: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.photo_camera,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.mic,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                          ),
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.qr_code))
                      ],
                    ),
                  ),
                )),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AddressBox(),
              SizedBox(
                height: 10,
              ),
              TopCategories(),
              CarousalImage(),
              DealOfDay(),
            ],
          ),
        ));
  }
}
