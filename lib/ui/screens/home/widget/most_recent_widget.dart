import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class MostRecentWidget extends StatelessWidget {
  const MostRecentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width = SizeUtils.getWidth(context: context);
    var height = SizeUtils.getHeight(context: context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: height * 0.02,
      children: [
        Text('Most Recently', style: AppStyles.bold16White),
        SizedBox(
          height: height * 0.18,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, int index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.primaryColor,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Al-Anbiya', style: AppStyles.bold24Black),
                        Text('الأنبياء', style: AppStyles.bold24Black),
                        Text('112 Verses', style: AppStyles.bold14Black),
                      ],
                    ),
                    Image.asset('assets/images/most_recently.png'),
                  ],
                ),
              );
            },
            separatorBuilder: (context, int index) {
              return SizedBox(width: width * 0.04);
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
