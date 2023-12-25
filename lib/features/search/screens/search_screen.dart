import 'package:amazon_clone_try/constants/global_variables.dart';
import 'package:amazon_clone_try/features/home/widgets/address_box.dart';
import 'package:amazon_clone_try/features/search/services/search_services.dart';
import 'package:amazon_clone_try/features/search/widgets/search_product.dart';
import 'package:amazon_clone_try/models/product.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({required this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchServices searchServices = SearchServices();
  List<Product>? productList;

  @override
  void didChangeDependencies() async {
    productList = await searchServices.featchSearchProduct(
        context: context, query: widget.searchQuery);
    
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.only(left: 30, top: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.70,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            initialValue: widget.searchQuery,
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
        body: Column(
          children: [
            AddressBox(),
            productList == null
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.grey,
                  ))
                : productList!.isEmpty
                    ? const Center(
                        child: Text('No products found'),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemBuilder: (ctx, index) {
                            return SearchProduct(product: productList![index],);
                          },
                          itemCount: productList!.length,
                        ),
                      )
          ],
        ));
  }
}
