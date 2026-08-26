import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/widget/most_recent_widget.dart';
import 'package:islami_app/ui/screens/home/widget/sura_item_widget.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = SizeUtils.getWidth(context: context);
    var height = SizeUtils.getHeight(context: context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height * 0.02,
        children: [
          TextField(
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              prefixIcon: Image.asset('assets/images/search_icon.png'),
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16White,
              enabledBorder: _buildDecorationBorder(),
              focusedBorder: _buildDecorationBorder(),
            ),
          ),
          MostRecentWidget(),
          Text('Sura List', style: AppStyles.bold16White,),
          Expanded(child: ListView.separated(
              itemBuilder: (context, int index) {
                return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          AppRoutes.suraDetailsRouteName,
                          arguments: index);
                    },
                    child: SuraItemWidget(index: index,));
              },
              separatorBuilder: (context, int index) {
                return Divider(
                  color: AppColors.whiteColor,
                  thickness: 2,
                  height: height * 0.02,
                  indent: width * 0.06,
                  endIndent: width * 0.06,
                );
              },
              itemCount: 114))
        ],
      ),
    );
  }

  OutlineInputBorder _buildDecorationBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 2,
        )
    );
  }
}
