import 'package:amazon_clone_try/features/account/widgets/single_product.dart';
import 'package:amazon_clone_try/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone_try/features/admin/services/admin_services.dart';
import 'package:amazon_clone_try/models/product.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final adminService = AdminService();
  List<Product>? products;
  @override
  void initState() {
    featchAllProducts();
    super.initState();
  }

  Future<void> featchAllProducts() async {
    products = await adminService.featchAllProducts(context);
    setState(() {});
  }

  void deleteProduct(String id, ) async {
    await adminService.deleteProduct(id: id, context: context);
    setState(() { 
     featchAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: products == null
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.grey,
            ))
          : products!.isEmpty
              ? Center(
                  child: Text('no Products found'),
                )
              : RefreshIndicator(
                onRefresh: featchAllProducts,
                child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3/4,
                        ),
                        itemCount: products!.length,
                        
                
                        itemBuilder: (ctx, index) {
                          return Padding(
                
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 140,
                                  child: SingleProduct(
                                      imgSrc: products![index].imgUrls[0]),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        products![index].name,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    IconButton(onPressed: (){
                                      deleteProduct(products![index].id!);
                                    }, icon: const Icon(Icons.delete_outline))
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
              ),
                
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        tooltip: 'Add a product',
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AddProductScreen.routeName);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
