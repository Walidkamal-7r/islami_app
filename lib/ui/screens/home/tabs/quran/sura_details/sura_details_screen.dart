import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/sura_details/sura_content.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var height = SizeUtils.getHeight(context: context);
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        centerTitle: true,
        title: Text(
          QuranResources.englishQuranSuraList[index],
          style: AppStyles.bold20Primary,
        ),
      ),
      body: Column(
        spacing: height * 0.02,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppAssets.leftCorner),
              Text(
                QuranResources.arabicQuranSuraList[index],
                style: AppStyles.bold24Primary,
              ),
              Image.asset(AppAssets.rightCorner),
            ],
          ),
          Expanded(
            child: verses.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  )
                : ListView.separated(
                    itemBuilder: (context, int index) {
                      return SuraContent(content: verses[index], index: index);
                    },
                    separatorBuilder: (context, int index) {
                      return SizedBox(height: height * 0.02);
                    },
                    itemCount: verses.length,
                  ),
          ),
          Image.asset(AppAssets.bottomDecoration),
        ],
      ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/files/quran/${index + 1}.txt",
    );
    List<String> lines = fileContent.split('\n');
    verses = lines;
    setState(() {});
  }
}
