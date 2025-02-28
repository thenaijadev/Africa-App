import 'package:country_app/config/router/routes.dart';
import 'package:country_app/core/constants/app_colors.dart';
import 'package:country_app/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isAnimated = true;
  @override
  void initState() {
    setState(() {
      isAnimated = false;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 2),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/africa.png",
                  width: 200,
                  color: Color(0xff333333),
                ),
                Gap(40),
                TextWidget(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  text: "Get Started",
                  color: AppColors.secondary,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextWidget(
                    fontSize: 16,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    text:
                        "Learn about the countries of our beautiful continent!",
                    color: AppColors.secondary,
                  ),
                ),
                Gap(100),
              ],
            )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/onboarding_top.png"),
              Image.asset("assets/images/onboarding_bottom.png")
            ],
          )
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.countries);
        },
        child: Image.asset(
          "assets/images/fab.png",
          width: 120,
        ),
      ),
    );
  }
}
