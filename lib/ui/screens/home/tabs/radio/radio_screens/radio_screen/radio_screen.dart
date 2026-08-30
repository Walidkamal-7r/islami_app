import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/tabs/radio/widget/radioWidget.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/size_utils.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = SizeUtils.getHeight(context: context);
    return Column(
      spacing: height * 0.02,
      children: [
        RadioWidget(
          radioName: 'Radio Ibrahim Al-Akdar',
          imagePath: AppAssets.off,
        ),
        RadioWidget(
          radioName: 'Radio Al-Qaria Yassen',
          imagePath: AppAssets.on,
        ),
        RadioWidget(
          radioName: 'Radio Ahmed Al-trabulsi',
          imagePath: AppAssets.off,
        ),
        RadioWidget(
          radioName: 'Radio Addokali Mohammad',
          imagePath: AppAssets.off,
        ),
      ],
    );
  }
}
