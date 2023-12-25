import 'dart:math';

import 'package:amazon_clone_try/constants/global_variables.dart';
import 'package:amazon_clone_try/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    String userAddress =
        Provider.of<UserProvider>(context, listen: false).user.address;
    List<String> addressList = userAddress.split(' ');
    String city = '';
    String pin = '';

    if (addressList.length > 1) {
      city = addressList.last;
      pin = addressList[addressList.length - 2];
    }

    return InkWell(
      onTap: () {},
      child: Container(
          height: 40,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 114, 226, 221),
            Color.fromARGB(255, 162, 236, 233),
          ], stops: [
            0.5,
            1.0
          ])),
          padding: EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.location_on_outlined,
                  color: Colors.black87,
                ),
              ),
              Expanded(
                child: Text(
                  'Deliver to - ${city} ${pin}',
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Icon(Icons.arrow_drop_down_outlined),
              )
            ],
          )),
    );
  }
}
