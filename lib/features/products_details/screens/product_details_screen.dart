import 'package:amazon_clone_try/common/widget/custom_button.dart';
import 'package:amazon_clone_try/common/widget/stars.dart';
import 'package:amazon_clone_try/constants/global_variables.dart';
import 'package:amazon_clone_try/features/products_details/services/product_details_services.dart';
import 'package:amazon_clone_try/features/search/screens/search_screen.dart';
import 'package:amazon_clone_try/models/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = '/product-details';
  final Product product;
  // final String searchQuery;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsServices _productDetailsServices = ProductDetailsServices();
  void navigateToSearchScreen(String query) {
    Navigator.of(context).pushNamed(SearchScreen.routeName, arguments: query);
  }
  var rating;

  @override
  void initState() {
    rating = _productDetailsServices.averageRating(product: widget.product);
    super.initState();
  }

  void addToCart(){
    _productDetailsServices.addToCart(product: widget.product, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          flexibleSpace: Container(
              padding:
                  const EdgeInsets.only(top: 10, left: 15, right: 5, bottom: 5),
              decoration: const BoxDecoration(
                  gradient: GloabalVariables.appBarGradient),
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.only(left: 30, top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: TextFormField(
                          onFieldSubmitted: navigateToSearchScreen,
                          textAlign: TextAlign.center,
                          // initialValue: widget.searchQuery,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.all(5),
                            hintText: 'Search Amazon.in',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            suffixIcon: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.qr_code))
                    ],
                  ),
                ),
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'brand: xyz',
                  style: TextStyle(color: Colors.teal, fontSize: 13),
                ),
                if(rating!=null) StarRatings(
                  rating: rating ,
                )
              ],
            ),
            Text(
              widget.product.name,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25),
            ),
            CarouselSlider(
                items: widget.product.imgUrls
                    .map((i) => Image.network(
                          i,
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
                options: CarouselOptions(
                    viewportFraction: 1,
                    height: MediaQuery.of(context).size.height * 0.5)),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$${widget.product.price}',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.product.description,
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.yellow),
              onPressed: addToCart,
              child: const Text('Add to Cart'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: Text('Buy Now'),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Rate the product'),
            RatingBar.builder(
              minRating: 1,
              direction: Axis.horizontal,
              itemPadding: EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, _){
                return Icon(Icons.star, color: GloabalVariables.secondaryColor,);
              },
              onRatingUpdate: (rating){
                _productDetailsServices.rateProduct(rating: rating, product: widget.product, context: context);
              },
            )
          ]),
        ),
      ),
    );
  }
}
