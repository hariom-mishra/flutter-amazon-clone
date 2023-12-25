import 'package:amazon_clone_try/constants/global_variables.dart';
import 'package:amazon_clone_try/features/account/widgets/single_product.dart';
import 'package:amazon_clone_try/features/home/screens/home_screen.dart';
import 'package:amazon_clone_try/features/home/services/home_services.dart';
import 'package:amazon_clone_try/models/product.dart';
import 'package:flutter/material.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-deals-screen';
  final String category;
  const CategoryDealsScreen({required this.category});

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  List<Product>? productList;
  HomeServices homeServices = HomeServices();

  @override
  void didChangeDependencies() async {
    productList = await homeServices.featchCategoryProducts(
        context: context, category: widget.category);
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                BoxDecoration(gradient: GloabalVariables.appBarGradient),
          ),
          title: Text(widget.category),
        ),
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          alignment: Alignment.topLeft,
          child: Text(
            'Keep shopping for ${widget.category}',
            style: const TextStyle(fontSize: 20),
          ),
        ),
        productList == null
            ? const CircularProgressIndicator(
                color: Colors.grey,
              )
            : Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: productList!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 140,
                            child: SingleProduct(
                                imgSrc: productList![index].imgUrls[0]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Text(
                                  productList![index].name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
      ]),
    );
  }
}
