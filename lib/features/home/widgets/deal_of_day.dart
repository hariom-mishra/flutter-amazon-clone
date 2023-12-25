import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10, top: 15),
          child: Text(
            'Deal of the day',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Image.network(
            'https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bWFjYm9va3xlbnwwfHwwfHx8MA%3D%3D',
            fit: BoxFit.cover,
            height: 250,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          alignment: Alignment.topLeft,
          child: Text(
            '\$100',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 40, bottom: 10),
          alignment: Alignment.topLeft,
          child: Text(
              'Macbook air m2 with 16 gb ram and with newly launced m2 chipset'),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                    'https://images.unsplash.com/photo-1522169799806-79cb544552bf?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1hY2Jvb2slMjBhaXJ8ZW58MHx8MHx8fDA%3D',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover),
                SizedBox(
                  width: 5,
                ),
                Image.network(
                    'https://images.unsplash.com/photo-1522169799806-79cb544552bf?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1hY2Jvb2slMjBhaXJ8ZW58MHx8MHx8fDA%3D',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover),
                SizedBox(
                  width: 5,
                ),
                Image.network(
                    'https://images.unsplash.com/photo-1522169799806-79cb544552bf?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1hY2Jvb2slMjBhaXJ8ZW58MHx8MHx8fDA%3D',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover),
                SizedBox(
                  width: 5,
                ),
                Image.network(
                    'https://images.unsplash.com/photo-1522169799806-79cb544552bf?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1hY2Jvb2slMjBhaXJ8ZW58MHx8MHx8fDA%3D',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover),
                SizedBox(
                  width: 5,
                ),
                Image.network(
                    'https://images.unsplash.com/photo-1522169799806-79cb544552bf?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1hY2Jvb2slMjBhaXJ8ZW58MHx8MHx8fDA%3D',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover),
                SizedBox(
                  width: 5,
                ),
                Image.network(
                    'https://images.unsplash.com/photo-1522169799806-79cb544552bf?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1hY2Jvb2slMjBhaXJ8ZW58MHx8MHx8fDA%3D',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover),
              ],
            ),),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(vertical: 15).copyWith(left: 10),
              child: Text('see all the deals', style: TextStyle(color: Colors.cyan[800]),),
            )
      ],
    );
  }
}
