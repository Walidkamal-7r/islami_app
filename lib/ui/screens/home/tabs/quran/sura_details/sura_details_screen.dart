import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/quran_resources.dart';
import 'package:islami_app/provider/most_recent_provider.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/sura_details/sura_content.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/sura_details1/sura_content1.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  bool isFirstDesign = true;
  late MostRecentProvider mostRecentProvider;

  @override
  Widget build(BuildContext context) {
    var width = SizeUtils.getWidth(context: context);
    var height = SizeUtils.getHeight(context: context);
    int index = ModalRoute.of(context)?.settings.arguments as int;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
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
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                isFirstDesign = !isFirstDesign;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              child: Icon(Icons.swap_horizontal_circle_outlined,
                color: AppColors.primaryColor,),
            ),
          )
        ],
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
                : isFirstDesign
                ? ListView.separated(
              itemBuilder: (context, int i) {
                return SuraContent(content: verses[i], index: i);
              },
              separatorBuilder: (context, int i) {
                return SizedBox(height: height * 0.02);
              },
              itemCount: verses.length,
            )
                : SingleChildScrollView(
              child: SuraContent1(content: joinedVerses()),
            ),
          ),
          Image.asset(AppAssets.bottomDecoration),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    mostRecentProvider.readMostRecent();
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/files/quran/${index + 1}.txt",
    );
    List<String> lines = fileContent.split('\n');
    verses = lines;
    setState(() {});
  }

  String joinedVerses() {
    List<String> numbered = [];
    for (int i = 0; i < verses.length; i++) {
      numbered.add('${verses[i]} [${i + 1}]');
    }
    return numbered.join('  ');
  }
}