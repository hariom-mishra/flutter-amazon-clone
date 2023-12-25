import 'package:amazon_clone_try/constants/global_variables.dart';
import 'package:amazon_clone_try/features/account/screens/account_screen.dart';
import 'package:amazon_clone_try/features/cart/screen/cart_screen.dart';
import 'package:amazon_clone_try/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages =[
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen()
  ];

  void _updatePage(int page){
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _updatePage,
        currentIndex: _page,
        selectedItemColor: GloabalVariables.selectedNavBarColor,
        unselectedItemColor: GloabalVariables.unselectedNavBarColor,
        backgroundColor: GloabalVariables.backgroundColor,
        iconSize: 28,
        items: [
          //Home
          BottomNavigationBarItem(
            
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 0
                    ? GloabalVariables.selectedNavBarColor
                    : GloabalVariables.backgroundColor,
                width: bottomBarBorderWidth,
              ))),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),

          //Profile
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 1
                    ? GloabalVariables.selectedNavBarColor
                    : GloabalVariables.backgroundColor,
                width: bottomBarBorderWidth,
              ))),
              child: const Icon(Icons.person_outline_outlined),
            ),
            label: '',
          ),

          //cart
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 2
                    ? GloabalVariables.selectedNavBarColor
                    : GloabalVariables.backgroundColor,
                width: bottomBarBorderWidth,
              ))),
              child: const badge.Badge(
                badgeContent: Text('2'),
                badgeStyle: badge.BadgeStyle(badgeColor: Colors.white, elevation: 0,padding: EdgeInsets.all(0), ),
                child: Icon(Icons.shopping_cart_outlined)),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
