import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/tabs/radio/widget/recitersWidget.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/size_utils.dart';

class ReciterScreen extends StatelessWidget {
  const ReciterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = SizeUtils.getHeight(context: context);
    return Column(
      spacing: height * 0.02,
      children: [
        RecitersWidget(
          reciterName: 'Ibrahim Al-Akdar', imagePath: AppAssets.off,),
        RecitersWidget(
          reciterName: 'Akram Alalaqmi', imagePath: AppAssets.off,),
        RecitersWidget(reciterName: 'Majed Al-Enezi', imagePath: AppAssets.on,),
        RecitersWidget(
          reciterName: 'Malik shaibat Alhamed', imagePath: AppAssets.off,),
      ],
    );
  }
}
