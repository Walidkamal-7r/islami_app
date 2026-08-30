import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeth.dart';
import 'package:islami_app/ui/screens/home/tabs/hadeth/widget/hadeth_text_widget.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class HadethItem extends StatefulWidget {
  final int index;

  const HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  void initState() {
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    var height = SizeUtils.getHeight(context: context);
    var width = SizeUtils.getWidth(context: context);
    return hadeth == null
        ? Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.primaryColor,
              image: DecorationImage(image: AssetImage(AppAssets.hadethCardBg)),
            ),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02,
                        vertical: height * 0.01,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            AppAssets.leftCorner,
                            width: width * 0.16,
                            color: AppColors.blackColor,
                          ),
                          Image.asset(
                            AppAssets.rightCorner,
                            width: width * 0.16,
                            color: AppColors.blackColor,
                          ),
                        ],
                      ),
                    ),
                    HadethTextWidget(
                      text: hadeth?.title ?? '',
                      textStyle: AppStyles.bold24Black,
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: HadethTextWidget(
                      text: hadeth?.content ?? '',
                      textStyle: AppStyles.bold16Black,
                    ),
                  ),
                ),
                Image.asset(
                  AppAssets.bottomDecoration,
                  color: AppColors.lighterBlackColor,
                ),
              ],
            ),
          );
  }

  void loadHadethFile() async {
    String hadethContent = await rootBundle.loadString(
      'assets/files/hadeeth/h${widget.index}.txt',
    );
    String title = hadethContent.substring(0, hadethContent.indexOf('\n'));
    String content = hadethContent.substring(hadethContent.indexOf('\n') + 1);
    hadeth = Hadeth(title: title, content: content);
    setState(() {});
  }
}
