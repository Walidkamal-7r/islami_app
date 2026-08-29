import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class RadioWidget extends StatelessWidget {
  const RadioWidget({
    super.key,
    required this.radioName,
    required this.imagePath,
  });

  final String radioName;

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    var width = SizeUtils.getWidth(context: context);
    var height = SizeUtils.getHeight(context: context);
    return Container(
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      width: width * 0.9,
      height: height * 0.13,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(radioName, style: AppStyles.bold20Black),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_arrow, size: width * 0.1),
                  Icon(Icons.volume_down_rounded, size: width * 0.1),
                ],
              ),
            ],
          ),
          Image.asset(imagePath, color: AppColors.lighterBlackColor),
        ],
      ),
    );
  }
}
