import 'package:amazon_clone_try/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarousalImage extends StatelessWidget {
  const CarousalImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: GloabalVariables.carouselImages.map((i) {
          return Builder(
              builder: (context) => Image.network(
                    i,
                    fit: BoxFit.cover,
                    height: 200,
                  ));
        }).toList(),
        options: CarouselOptions(
          viewportFraction: 1,
          height: 200,
        ));
  }
}
