import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/size_utils.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double turns = 0;
  final int sebhaCount = 33;
  int currentCount = 1;
  int tasbehIndex = 0;

  final List<String> tasbeh = [
    'سُبْحَانَ اللهِ',
    'الحَمْدُ لِلَّهِ',
    'اللهُ أَكْبَرُ',
    'لاَ إِلَهَ إِلَّا اللَّهُ'
  ];

  @override
  Widget build(BuildContext context) {
    var height = SizeUtils.getHeight(context: context);
    return Expanded(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
                  style: AppStyles.bold36White),
              Image.asset(AppAssets.sebhaHead),
              Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          turns += 1 / sebhaCount;
                          if (currentCount == sebhaCount) {
                            currentCount = 1;
                            tasbehIndex++;
                            if (tasbehIndex == tasbeh.length) {
                              tasbehIndex = 0;
                            }
                          } else {
                            currentCount++;
                          }
                        }
                        );
                      },
                      child: AnimatedRotation(
                        turns: turns,
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.linear,
                        child: Image.asset(AppAssets.sebhaBody),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          tasbeh[tasbehIndex], style: AppStyles.bold36White,),
                        SizedBox(height: height * 0.06,),
                        Text('$currentCount', style: AppStyles.bold36White,)
                      ],
                    )
                  ]
              ),
            ],
          ),
        )
    );
  }
}
