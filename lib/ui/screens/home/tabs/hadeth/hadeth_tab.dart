import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/tabs/hadeth/widget/hadeth_item.dart';
import 'package:islami_app/utils/size_utils.dart';

class HadethTab extends StatelessWidget {
  HadethTab({super.key});

  final List<int> numbers = List.generate(50, (int index) => index + 1);

  @override
  Widget build(BuildContext context) {
    var height = SizeUtils.getHeight(context: context);
    return CarouselSlider(
      items: numbers.map((int index) {
        return HadethItem(index: index);
      }).toList(),
      options: CarouselOptions(height: height * 0.66, enlargeCenterPage: true),
    );
  }
}
