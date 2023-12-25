import 'package:amazon_clone_try/common/widget/custom_button.dart';
import 'package:amazon_clone_try/constants/global_variables.dart';
import 'package:amazon_clone_try/features/address/screen/address_screen.dart';
import 'package:amazon_clone_try/features/products_details/services/product_details_services.dart';
import 'package:amazon_clone_try/features/search/screens/search_screen.dart';
import 'package:amazon_clone_try/models/product.dart';
import 'package:amazon_clone_try/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {


  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    ProductDetailsServices productDetailsServices = ProductDetailsServices();
    
    List<dynamic> cartList = userProvider.user.cart;
    int sum = 0;
    cartList.map((e) => sum += e['quantity']*e['product']['price'] as int);
    void navigateToSearchScreen(String query) {
      Navigator.of(context).pushNamed(SearchScreen.routeName, arguments: query);
    }
    

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          flexibleSpace: Container(
              padding:
                  const EdgeInsets.only(top: 10, left: 15, right: 5, bottom: 5),
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
                      IconButton(onPressed: () {}, icon: Icon(Icons.qr_code))
                    ],
                  ),
                ),
              )),
        ),
      ),
      body: userProvider.user.cart.length == 0
          ? Center(
              child: Text('Start adding some products'),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomButton(
                        text:
                            'Proceed to Buy (${userProvider.user.cart.length} item)',
                        onClick: () {
                          Navigator.of(context).pushNamed(AddressScreen.routeName, arguments: sum.toString());
                        }),
                    Expanded(
                      child: ListView.builder(
                          
                          padding: EdgeInsets.only(top: 10),
                          itemCount: cartList.length,
                          itemBuilder: (context, index) {
                            var product = cartList[index]['product'];
                            var quantity = cartList[index]['quantity'];
                            int sum = 0;
                            
                            
                            return Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(color: Colors.black12),
                                
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      product['imgUrls'][0],
                                      fit: BoxFit.cover,
                                      height: MediaQuery.of(context).size.height *
                                          0.27,
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product['name'],
                                            style: const TextStyle(fontSize: 16),
                                            maxLines: 2,
                                          ),
                                          Text(
                                            '\$${product['price']}',
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Text(
                                            'Eligible for FREE shipping',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          const Text(
                                            'In Stock',
                                            style: TextStyle(color: Colors.teal),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                                            child: Row(
                                              children: [
                                                IconButton(icon: Icon(Icons.delete_outline), onPressed: (){},),
                                                SizedBox(width: 3,),
                                                Text('$quantity'),
                                                 SizedBox(width: 3,),
                                                IconButton(onPressed: (){
                                                  setState(() { 
                                                  productDetailsServices.addToCart(product: Product.fromMap(product), context: context);
                                                  });
                                                }, icon: Icon(Icons.add))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ));
                          }),
                    )
                  ]),
            ),
    );
  }
}
