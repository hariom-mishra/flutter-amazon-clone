import 'package:amazon_clone_try/features/home/screens/category_deals_screen.dart';
import 'package:flutter/material.dart';

class SingleCategory extends StatelessWidget {
  final String imgUrl;
  final String categoryTitle;
  
  const SingleCategory({required this.imgUrl, required this.categoryTitle});

  void navigateToCategoryPage(BuildContext context){
    Navigator.of(context).pushNamed(CategoryDealsScreen.routeName, arguments: categoryTitle);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateToCategoryPage(context);
      },
      child: Container(
        padding: EdgeInsets.all(5),
        height: 120,
        width: 80,
        child: Column(children: [
          Image.asset(
            imgUrl,
            fit: BoxFit.cover,
            height: 50,
            width: 80,
          ),
          FittedBox(
            child: Text(
              categoryTitle,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
