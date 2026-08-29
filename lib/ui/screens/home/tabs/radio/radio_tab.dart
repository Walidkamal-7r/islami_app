import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/tabs/radio/radio_screens/radio_screen/radio_screen.dart';
import 'package:islami_app/ui/screens/home/tabs/radio/radio_screens/reciters_screen/reciter_screen.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    var width = SizeUtils.getWidth(context: context);
    var height = SizeUtils.getHeight(context: context);
    return Column(
      spacing: height * 0.02,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isSelected = true;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.17, vertical: height * 0.005),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryColor : AppColors
                      .lighterBlackColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child:
                Text('Radio',
                    style: isSelected ? AppStyles.bold14Black.copyWith(
                        fontSize: 16) : AppStyles.bold16White),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isSelected = false;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.17, vertical: height * 0.005),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.lighterBlackColor : AppColors
                      .primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child:
                Text('Reciters',
                    style: isSelected ? AppStyles.bold16White : AppStyles
                        .bold14Black.copyWith(fontSize: 16)),
              ),
            ),
          ],
        ),
        Expanded(
          child: isSelected ? const RadioScreen() : const ReciterScreen(),
        )
      ],
    );
  }
}
