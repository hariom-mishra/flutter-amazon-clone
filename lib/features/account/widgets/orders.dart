import 'package:amazon_clone_try/constants/global_variables.dart';
import 'package:amazon_clone_try/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List imageList = [
    'https://images.unsplash.com/photo-1702234728311-baaa6c8aa212?q=80&w=1472&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1702234728311-baaa6c8aa212?q=80&w=1472&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1702234728311-baaa6c8aa212?q=80&w=1472&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1702234728311-baaa6c8aa212?q=80&w=1472&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1702234728311-baaa6c8aa212?q=80&w=1472&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Orders',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              GestureDetector(
                onTap: () {
                  
                },
                child: Text(
                  'see all',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
          Container(
            height: 170,
            padding: EdgeInsets.only(top: 20, left: 10, right: 10,),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageList.length, itemBuilder: (context, index){
              return SingleProduct(imgSrc: imageList[index],);
            },),
          ),
        ],
      ),
    );
  }
}
