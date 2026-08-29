import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/time/time_tab.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<String> backgroundImages = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];
  List<Widget> tabsList = [
    QuranTab(), HadethTab(), SebhaTab(), RadioTab(), TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    var height = SizeUtils.getHeight(context: context);
    return Stack(
      children: [
        Image.asset(backgroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: AppColors.transparentColor,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: AppColors.primaryColor
            ),
            child: BottomNavigationBar(
                selectedItemColor: AppColors.whiteColor,
                unselectedItemColor: AppColors.blackColor,
                selectedLabelStyle: AppStyles.bold12White,
                currentIndex: selectedIndex,
                onTap: (int index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  _buildBottomNavBarItem(
                      iconName: AppAssets.quranIcon, label: 'Quran', index: 0),
                  _buildBottomNavBarItem(iconName: AppAssets.hadethIcon,
                      label: 'Hadeth',
                      index: 1),
                  _buildBottomNavBarItem(
                      iconName: AppAssets.sebhaIcon, label: 'Sebha', index: 2),
                  _buildBottomNavBarItem(
                      iconName: AppAssets.radioIcon, label: 'Radio', index: 3),
                  _buildBottomNavBarItem(
                      iconName: AppAssets.timeIcon, label: 'Time', index: 4)
                ]
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Image.asset(AppAssets.logo, height: height * 0.15,),
                Expanded(child: tabsList[selectedIndex])
              ],
            ),
          ),
        )
      ],
    );
  }

  BottomNavigationBarItem _buildBottomNavBarItem(
      {required String iconName, required String label, required int index}) {
    var width = SizeUtils.getWidth(context: context);
    var height = SizeUtils.getHeight(context: context);
    return BottomNavigationBarItem(
        icon: selectedIndex == index ?
        Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: height * 0.006),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.lightBlackColor
            ),
            child: ImageIcon(AssetImage(iconName))) :
        ImageIcon(AssetImage(iconName)
        ),
        label: label);
  }
}
