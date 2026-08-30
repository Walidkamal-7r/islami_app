import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/sura_details1/sura_content1.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class SuraDetailsScreen1 extends StatefulWidget {
  const SuraDetailsScreen1({super.key});

  @override
  State<SuraDetailsScreen1> createState() => _SuraDetailsScreen1State();
}

class _SuraDetailsScreen1State extends State<SuraDetailsScreen1> {
  String verses = '';

  @override
  Widget build(BuildContext context) {
    var width = SizeUtils.getWidth(context: context);
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Row(
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
          ),
          Expanded(
            child: verses.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  )
                : SingleChildScrollView(child: SuraContent1(content: verses)),
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
    for (int i = 0; i < lines.length; i++) {
      lines[i] += '[${i + 1}]';
    }
    verses = lines.join('  ');
    setState(() {});
  }
}
