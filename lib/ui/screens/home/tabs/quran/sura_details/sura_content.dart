import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class SuraContent extends StatefulWidget {
  final String content;

  final int index;

  const SuraContent({super.key, required this.content, required this.index});

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    var width = SizeUtils.getWidth(context: context);
    var height = SizeUtils.getHeight(context: context);
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.04),
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.transparentColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.primaryColor, width: 2),
        ),
        child: Text(
          '${widget.content} [${widget.index + 1}]',
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: AppStyles.bold20Primary.copyWith(
            color: isSelected ? AppColors.blackColor : AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
