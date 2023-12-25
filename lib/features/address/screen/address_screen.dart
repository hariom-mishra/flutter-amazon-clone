import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

import 'package:amazon_clone_try/common/widget/custom_textfield.dart';
import 'package:amazon_clone_try/constants/global_variables.dart';
import 'package:amazon_clone_try/providers/user_provider.dart';

class AddressScreen extends StatefulWidget {
  static const routeName = '/address';
  final String totalAmount;

  AddressScreen({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _addressFormKey = GlobalKey<FormState>();

  final _firstLineAddress = TextEditingController();

  final _secondLineAddress = TextEditingController();

  final _thirdLineAddress = TextEditingController();

  List<PaymentItem> paymentItems = [];

  @override
  void dispose() {
    _firstLineAddress.dispose();
    _secondLineAddress.dispose();
    _thirdLineAddress.dispose();
    super.dispose();
  }

  @override
  void initState() {
    paymentItems.add(PaymentItem(
        amount: widget.totalAmount,
        label: 'total amount',
        status: PaymentItemStatus.final_price));
    super.initState();
  }

  void onGpayResult(res) {}

  @override
  Widget build(BuildContext context) {
    // var address = context.watch<UserProvider>().user.address;
    var address = 'Fake stree 101';
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GloabalVariables.appBarGradient),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: _addressFormKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      if (address.isNotEmpty)
                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              child: Text(
                                '$address',
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black38,
                                  ),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            Text(
                              'OR',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      CustomTextField(
                          hintText: 'Flat, House No., Building',
                          controller: _firstLineAddress),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hintText: 'Area, Street',
                          controller: _secondLineAddress),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hintText: 'pincode', controller: _thirdLineAddress),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hintText: 'Town/city', controller: _thirdLineAddress),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GooglePayButton(
              width: double.infinity,
              height: 50,
              onError: (e){
                print('error $e');
              },
              margin: const EdgeInsets.only(top: 15),
              type: GooglePayButtonType.buy,
              onPaymentResult: onGpayResult,
              paymentConfigurationAsset: 'gpay.json',
              paymentItems: paymentItems,
              loadingIndicator: const Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
