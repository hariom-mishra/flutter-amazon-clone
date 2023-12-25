import 'dart:io';
import 'dart:math';

import 'package:amazon_clone_try/common/widget/custom_button.dart';
import 'package:amazon_clone_try/common/widget/custom_textfield.dart';
import 'package:amazon_clone_try/constants/global_variables.dart';
import 'package:amazon_clone_try/constants/utils.dart';
import 'package:amazon_clone_try/features/admin/services/admin_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _qunatityController = TextEditingController();
  final _addProductKey = GlobalKey<FormState>();
  final adminService = AdminService(); 

  String defaultCategory = 'Mobiles';

  List<String> productCategories = [
    'Mobiles',
    'Electronics',
    'Appliances',
    'Books & Toys',
    'Fashion',
    'Fresh',
    'Home',
    'Beauty',
    'Furniture',
    'Pharmacy',
  ];

  List<File> _images = [];

  @override
  void dispose() {
    _descriptionController.dispose();
    _priceController.dispose();
    _productNameController.dispose();
    _qunatityController.dispose();
    super.dispose();
  }

  void sellProduct(){

    print('sell product');
    adminService.sellProduct(context: context,
     name: _productNameController.text,
     description: _descriptionController.text,
     category: defaultCategory,
     price: double.parse(_priceController.text),
     quantity: int.parse(_qunatityController.text) , 
     images: _images);
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      _images = res;
    });
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
            title: const Text(
              'Add product',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
                key: _addProductKey,
                child: Column(
                  children: [
                    DottedBorder(
                        borderType: BorderType.RRect,
                        dashPattern: const [10, 4],
                        strokeCap: StrokeCap.round,
                        radius: const Radius.circular(10),
                        child: _images.isNotEmpty
                            ? CarouselSlider(
                                items:
                                    _images.map((e) => Image.file(e, fit: BoxFit.cover,)).toList(),
                                options: CarouselOptions(
                                    height: 200, viewportFraction: 1))
                            : InkWell(
                                onTap: selectImages,
                                child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.folder_outlined),
                                        Text(
                                          'select product images',
                                          style:
                                              TextStyle(color: Colors.black12),
                                        )
                                      ]),
                                ),
                              )),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                        hintText: 'Product Name',
                        controller: _productNameController),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'Description',
                      controller: _descriptionController,
                      maxLines: 7,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        hintText: 'Price', controller: _priceController),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        hintText: 'Quantity',
                        controller: _qunatityController),
                    SizedBox(
                      width: double.infinity,
                      child: DropdownButton(
                        value: defaultCategory,
                        items: productCategories
                            .map((item) => DropdownMenuItem(
                                  child: Text(item),
                                  value: item,
                                ))
                            .toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            defaultCategory = newVal!;
                          });
                        },
                        icon: Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(text: 'Add Product', onClick: () {
                      if(_addProductKey.currentState!.validate() || _images.isNotEmpty){
                        sellProduct();
                      }
                    })
                  ],
                )),
          ),
        ));
  }
}
