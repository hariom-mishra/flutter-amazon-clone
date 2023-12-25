import 'package:amazon_clone_try/common/widget/bottom_bar.dart';
import 'package:amazon_clone_try/features/address/screen/address_screen.dart';
import 'package:amazon_clone_try/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone_try/features/auth/screens/auth_screnn.dart';
import 'package:amazon_clone_try/features/home/screens/category_deals_screen.dart';
import 'package:amazon_clone_try/features/home/screens/home_screen.dart';
import 'package:amazon_clone_try/features/products_details/screens/product_details_screen.dart';
import 'package:amazon_clone_try/features/search/screens/search_screen.dart';
import 'package:amazon_clone_try/models/product.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => HomeScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => BottomBar());
    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => CategoryDealsScreen(category: category));
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddProductScreen(),
      );
    case ProductDetailsScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(product: product),
          settings: routeSettings);
    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => AddressScreen(totalAmount: totalAmount ,),
          settings: routeSettings);
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(searchQuery: searchQuery),
      );
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('Screen deos not exist!'),
                ),
              ));
  }
}
