import 'package:amazon_clone_try/features/home/widgets/single_category.dart';
import 'package:amazon_clone_try/models/category.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  List<Category> categoryList = [
    Category(id: 1, categoryTitle: 'Prime', imgUrl: 'assets/images/prime.jpg'),
    Category(id: 2, categoryTitle: 'Fresh', imgUrl: 'assets/images/fresh.jpg'),
    Category(id: 3, categoryTitle: 'Mobiles', imgUrl: 'assets/images/mobiles.jpeg'),
    Category(id: 4, categoryTitle: 'Fashion', imgUrl: 'assets/images/fashion.jpeg'),
    Category(id: 5, categoryTitle: 'miniTv', imgUrl: 'assets/images/miniTv.jpeg'),
    Category(id: 6, categoryTitle: 'Deals', imgUrl: 'assets/images/deals.jpg'),
    Category(id: 7, categoryTitle: 'Electronics', imgUrl: 'assets/images/electronics.jpeg'),
    Category(id: 8, categoryTitle: 'Home', imgUrl: 'assets/images/home.jpg'),
    Category(id: 9, categoryTitle: 'Travel', imgUrl: 'assets/images/travel.jpg'),
    Category(id: 10, categoryTitle: 'Beauty', imgUrl: 'assets/images/beauty.jpg'),
    Category(id: 11, categoryTitle: 'Movies', imgUrl: 'assets/images/movies.jpg'),
    Category(id: 12, categoryTitle: 'Furniture', imgUrl: 'assets/images/furniture.jpg'),
    Category(id: 13, categoryTitle: 'Books, Toys', imgUrl: 'assets/images/books.jpeg'),
    Category(id: 14, categoryTitle: 'Pharmacy', imgUrl: 'assets/images/pharmacy.jpg'),
    Category(id: 15, categoryTitle: 'Appliances', imgUrl: 'assets/images/appliances.jpeg'),
    Category(id: 16, categoryTitle: 'More', imgUrl: 'assets/images/more.jpg')
  ];

  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SingleCategory(categoryTitle: categoryList[index].categoryTitle, imgUrl: categoryList[index].imgUrl,);
        },
      ),
    );
  }
}
