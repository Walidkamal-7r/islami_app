import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/tabs/radio/widget/reciters_widget.dart';
import 'package:islami_app/utils/size_utils.dart';

class ReciterScreen extends StatefulWidget {
  const ReciterScreen({super.key});

  @override
  State<ReciterScreen> createState() => _ReciterScreenState();
}

class _ReciterScreenState extends State<ReciterScreen> {
  @override
  Widget build(BuildContext context) {
    var height = SizeUtils.getHeight(context: context);
    return Column(
      spacing: height * 0.02,
      children: [
        RecitersWidget(reciterName: 'Ibrahim Al-Akdar',),
        RecitersWidget(reciterName: 'Akram Alalaqmi',),
        RecitersWidget(reciterName: 'Majed Al-Enezi',),
        RecitersWidget(reciterName: 'Malik shaibat Alhamed',),
      ],
    );
  }
}
