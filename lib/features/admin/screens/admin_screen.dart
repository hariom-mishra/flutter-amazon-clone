import 'package:amazon_clone_try/constants/global_variables.dart';
import 'package:amazon_clone_try/features/admin/screens/posts_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double borderWidth = 5;
  List<Widget> list = [
    PostsScreen(),
    Center(child: Text('analytics screen'),),
    Center(child: Text('Inbox'),)
  ];

  void _updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_page],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                BoxDecoration(gradient: GloabalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/amazon_in.png',
                color: Colors.black,
                width: 120,
                height: 40,
              ),
              Text(
                'Admin',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(

        onTap: _updatePage,
        currentIndex: _page,
        selectedItemColor: GloabalVariables.selectedNavBarColor,
        unselectedItemColor: GloabalVariables.unselectedNavBarColor,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _page == 0
                              ? GloabalVariables.selectedNavBarColor
                              : GloabalVariables.backgroundColor,
                          width: borderWidth))),
              child: Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _page == 1
                              ? GloabalVariables.selectedNavBarColor
                              : GloabalVariables.backgroundColor,
                          width: borderWidth))),
              child: Icon(Icons.analytics_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GloabalVariables.selectedNavBarColor
                        : GloabalVariables.backgroundColor,
                    width: borderWidth,
                  ),
                ),
              ),
              child: Icon(Icons.all_inbox_outlined),
            ),
            label: '',
          )
        ],
      ),
    );
  }
}
