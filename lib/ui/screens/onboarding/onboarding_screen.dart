import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/ui/screens/home/home_screen.dart';
import 'package:islami_app/utils/app_colors.dart';

class OnboardingScreenScreen extends StatelessWidget {
  const OnboardingScreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          Expanded(
            child: IntroductionScreen(
              controlsMargin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              controlsPadding: const EdgeInsets.symmetric(vertical: 8),
              globalBackgroundColor: AppColors.blackColor,
              showBackButton: true,
              showNextButton: true,
              showSkipButton: true,
              pages: [
                PageViewModel(
                  title: 'Welcome To Islami App',
                  body: '',
                  image: Center(
                    child: Image.asset('assets/images/welcome1.png'),
                  ),
                  decoration: const PageDecoration(
                    titleTextStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                    bodyTextStyle: TextStyle(
                      fontSize: 20,
                      color: AppColors.primaryColor,
                    ),
                    imageFlex: 3,
                    bodyFlex: 2,
                    imagePadding: EdgeInsets.zero,
                    titlePadding: EdgeInsets.only(top: 8),
                    bodyPadding: EdgeInsets.only(top: 30),
                    bodyAlignment: Alignment.bottomCenter,
                    imageAlignment: Alignment.center,
                  ),
                ),
                PageViewModel(
                  title: 'Welcome To Islami',
                  body: 'We Are Very Excited To Have You In Our Community',
                  image: Center(
                    child: Image.asset('assets/images/welcome2.png'),
                  ),
                  decoration: const PageDecoration(
                    titleTextStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                    bodyTextStyle: TextStyle(
                      fontSize: 20,
                      color: AppColors.primaryColor,
                    ),
                    imageFlex: 3,
                    bodyFlex: 2,
                    imagePadding: EdgeInsets.zero,
                    titlePadding: EdgeInsets.only(top: 8),
                    bodyPadding: EdgeInsets.only(top: 30),
                    bodyAlignment: Alignment.bottomCenter,
                    imageAlignment: Alignment.center,
                  ),
                ),
                PageViewModel(
                  title: 'Reading the Quran',
                  body: 'Read, and your Lord is the Most Generous',
                  image: Center(
                    child: Image.asset('assets/images/welcome3.png'),
                  ),
                  decoration: const PageDecoration(
                    titleTextStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                    bodyTextStyle: TextStyle(
                      fontSize: 20,
                      color: AppColors.primaryColor,
                    ),
                    imageFlex: 3,
                    bodyFlex: 2,
                    imagePadding: EdgeInsets.zero,
                    titlePadding: EdgeInsets.only(top: 8),
                    bodyPadding: EdgeInsets.only(top: 30),
                    bodyAlignment: Alignment.bottomCenter,
                    imageAlignment: Alignment.center,
                  ),
                ),
                PageViewModel(
                  title: 'Bearish',
                  body: 'Praise the name of your Lord, the Most High',
                  image: Center(
                    child: Image.asset('assets/images/welcome4.png'),
                  ),
                  decoration: const PageDecoration(
                    titleTextStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                    bodyTextStyle: TextStyle(
                      fontSize: 20,
                      color: AppColors.primaryColor,
                    ),
                    imageFlex: 3,
                    bodyFlex: 2,
                    imagePadding: EdgeInsets.zero,
                    titlePadding: EdgeInsets.only(top: 8),
                    bodyPadding: EdgeInsets.only(top: 30),
                    bodyAlignment: Alignment.bottomCenter,
                    imageAlignment: Alignment.center,
                  ),
                ),
                PageViewModel(
                  title: 'Holy Quran Radio',
                  body:
                      'You can listen to the Holy Quran Radio through the application for free and easily',
                  image: Center(
                    child: Image.asset('assets/images/welcome5.png'),
                  ),
                  decoration: const PageDecoration(
                    titleTextStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                    bodyTextStyle: TextStyle(
                      fontSize: 20,
                      color: AppColors.primaryColor,
                    ),
                    imageFlex: 3,
                    bodyFlex: 2,
                    imagePadding: EdgeInsets.zero,
                    titlePadding: EdgeInsets.only(top: 8),
                    bodyPadding: EdgeInsets.only(top: 30),
                    bodyAlignment: Alignment.bottomCenter,
                    imageAlignment: Alignment.center,
                  ),
                ),
              ],
              onDone: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              skip: const Text(
                'Skip',
                style: TextStyle(color: AppColors.primaryColor),
              ),
              next: const Text(
                'Next',
                style: TextStyle(color: AppColors.primaryColor),
              ),
              back: const Text(
                'Back',
                style: TextStyle(color: AppColors.primaryColor),
              ),
              done: const Text(
                'Done',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              dotsDecorator: DotsDecorator(
                color: Color(0xFF707070),
                activeColor: AppColors.primaryColor,
                activeSize: const Size(24, 8),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
