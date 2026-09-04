import 'package:flutter/material.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/provider/most_recent_provider.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_routes.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';
import 'package:provider/provider.dart';

class MostRecentWidget extends StatefulWidget {
  const MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mostRecentProvider.readMostRecent();
    },);
  }

  @override
  Widget build(BuildContext context) {
    var width = SizeUtils.getWidth(context: context);
    var height = SizeUtils.getHeight(context: context);
    var mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height * 0.02,
        children: [
          Text('Most Recently', style: AppStyles.bold16White),
          SizedBox(
            height: height * 0.18,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        AppRoutes.suraDetailsRouteName,
                        arguments: mostRecentProvider.mostRecentList[index]
                    );
                  },
                  child: Container(
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
                            Text(QuranResources
                                .englishQuranSuraList[mostRecentProvider
                                .mostRecentList[index]],
                                style: AppStyles.bold24Black),
                            Text(QuranResources
                                .arabicQuranSuraList[mostRecentProvider
                                .mostRecentList[index]],
                                style: AppStyles.bold24Black),
                            Text('${QuranResources
                                .ayaNumberList[mostRecentProvider
                                .mostRecentList[index]]} verses',
                                style: AppStyles.bold14Black),
                          ],
                        ),
                        Image.asset('assets/images/most_recently.png'),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, int index) {
                return SizedBox(width: width * 0.04);
              },
              itemCount: mostRecentProvider.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
