import 'package:amazon_clone_try/common/widget/custom_button.dart';
import 'package:amazon_clone_try/common/widget/stars.dart';
import 'package:amazon_clone_try/features/products_details/screens/product_details_screen.dart';
import 'package:amazon_clone_try/features/products_details/services/product_details_services.dart';
import 'package:amazon_clone_try/models/product.dart';
import 'package:flutter/material.dart';

class SearchProduct extends StatefulWidget {
  final Product product;
  const SearchProduct({required this.product});

  @override
  State<SearchProduct> createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  ProductDetailsServices productDetailsServices = ProductDetailsServices();
  void navigateToProductDetails(BuildContext ctx){
    Navigator.of(ctx).pushNamed(ProductDetailsScreen.routeName, arguments: widget.product);
  }

  var rating;

  @override
  void initState() {
    rating =productDetailsServices.averageRating(product: widget.product);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: ()=>navigateToProductDetails(context),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 5,
          left: 0,
        ),
        child: Card(
          color: Colors.white,
          elevation: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.product.imgUrls[0],
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.27,
                width: MediaQuery.of(context).size.width * 0.35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: const TextStyle(fontSize: 16),
                      maxLines: 2,
                    ),
                    if(rating!=null) StarRatings(rating: rating,),
                    Text(
                      '\$${widget.product.price}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text('Eligible for FREE shipping', style: TextStyle(fontSize: 12),),
                    const Text('In Stock', style: TextStyle(color: Colors.teal),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(MediaQuery.of(context).size.width * 0.4, 50),
                          shape: RoundedRectangleBorder(
                          
                            borderRadius: BorderRadius.circular(10),
                          )
                        ),
                        onPressed: (){}, child: Text('Add to cart')),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    
  }
}
