import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/tabs/radio/widget/radio_widget.dart';
import 'package:islami_app/utils/size_utils.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  @override
  Widget build(BuildContext context) {
    var height = SizeUtils.getHeight(context: context);
    return Column(
      spacing: height * 0.02,
      children: [
        RadioWidget(radioName: 'Radio Ibrahim Al-Akdar',
        ),
        RadioWidget(radioName: 'Radio Al-Qaria Yassen',
        ),
        RadioWidget(radioName: 'Radio Ahmed Al-trabulsi',
        ),
        RadioWidget(radioName: 'Radio Addokali Mohammad',
        ),
      ],
    );
  }
}
