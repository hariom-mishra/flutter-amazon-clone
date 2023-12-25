import 'package:amazon_clone_try/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Wrap(children: [
          GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            children: [
              AccountButton(text: 'Your Order', voidCallback: () {}),
              AccountButton(text: 'Buy Again', voidCallback: () {}),
              AccountButton(text: 'Your Account', voidCallback: () {}),
              AccountButton(text: 'Your List', voidCallback: () {})
            ],
          ),
        ]),
      ),
    );
  }
}
