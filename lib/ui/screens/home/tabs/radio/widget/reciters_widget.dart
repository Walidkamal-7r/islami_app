import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class RecitersWidget extends StatefulWidget {
  const RecitersWidget({
    super.key,
    required this.reciterName,
    this.isItOn = false,
  });

  final String reciterName;
  final bool isItOn;

  @override
  State<RecitersWidget> createState() => _RecitersWidgetState();
}

class _RecitersWidgetState extends State<RecitersWidget> {
  late bool isItOn = widget.isItOn;

  @override
  Widget build(BuildContext context) {
    var width = SizeUtils.getWidth(context: context);
    var height = SizeUtils.getHeight(context: context);
    return Container(
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      width: width * 0.9,
      height: height * 0.13,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(widget.reciterName, style: AppStyles.bold20Black),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isItOn = !isItOn;
                      });
                    },
                    child: Icon(
                      isItOn ? Icons.pause : Icons.play_arrow,
                      size: width * 0.1,
                    ),
                  ),
                  Icon(Icons.volume_down_rounded, size: width * 0.1),
                ],
              ),
            ],
          ),
          IgnorePointer(
            child: Image.asset(
              isItOn ? AppAssets.on : AppAssets.off,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}