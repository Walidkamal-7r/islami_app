import 'package:flutter/material.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/ui/screens/home/widget/most_recent_widget.dart';
import 'package:islami_app/ui/screens/home/widget/sura_item_widget.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114,
        (index) => index,
  );

  @override
  Widget build(BuildContext context) {
    var width = SizeUtils.getWidth(context: context);
    var height = SizeUtils.getHeight(context: context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height * 0.01,
        children: [
          TextField(
            style: AppStyles.bold20White,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              prefixIcon: Image.asset('assets/images/search_icon.png'),
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16White,
              enabledBorder: _buildDecorationBorder(),
              focusedBorder: _buildDecorationBorder(),
            ),
            onChanged: (text) {
              searchBySuraName(text);
            },
          ),
          MostRecentWidget(),
          Text('Sura List', style: AppStyles.bold16White,),
          Expanded(child: filterList.isEmpty ?
          Center(
            child: Text('No Sura Name Found', style: AppStyles.bold20Primary,),)
              :
          ListView.separated(
              itemBuilder: (context, int index) {
                return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          AppRoutes.suraDetailsRouteName,
                          arguments: filterList[index]);
                    },
                    child: SuraItemWidget(index: filterList[index],));
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
              itemCount: filterList.length
          )
          )
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

  void searchBySuraName(String suraName) {
    List<int> searchList = [];
    if (suraName.isEmpty) {
      filterList = List.generate(114, (index) => index,);
      setState(() {

      });
      return;
    }
    for (int i = 0; i < QuranResources.englishQuranSuraList.length; i++) {
      if (QuranResources.englishQuranSuraList[i].toLowerCase().contains(
          suraName.toLowerCase())) {
        searchList.add(i);
      }
      if (QuranResources.arabicQuranSuraList[i].toLowerCase().contains(
          suraName.toLowerCase())) {
        searchList.add(i);
      }
    }
    filterList = searchList;
    setState(() {

    });
  }
}
