import 'package:bookia/core/routes/routes_name.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/features/onboarding/ui/widgets/button.dart';
import 'package:bookia/features/onboarding/ui/widgets/header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset('assets/image/onboarding.png').image,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              135.verticalSpace,

              IconButton(
                onPressed: () {
                  if (context.locale.languageCode == 'ar') {
                    context.setLocale(const Locale('en'));
                  } else {
                    context.setLocale(const Locale('ar'));
                  }
                },
                icon: const Icon(Icons.language),
              ),

              OnboardingHeader(),

              330.verticalSpace,

              OnboardingButton(
                text: 'login'.tr(),
                foregroundColor: AppColors.white,
                backgroundColor: AppColors.gold,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.loginScreen);
                },
              ),

              15.verticalSpace,

              OnboardingButton(
                text: 'register'.tr(),
                foregroundColor: AppColors.black,
                backgroundColor: AppColors.white,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.registerScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
