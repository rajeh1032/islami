import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:islami/ui/home/tabs/hadith/hadith_item.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: CarouselSlider(
          options:
              CarouselOptions(height: height * 0.8, enlargeCenterPage: true),
          items: List.generate(50, (i) => i + 1).map((i) {
            return HadithItem(
              index: i,
            );
          }).toList(),
        ),
      ),
    );
  }
}
