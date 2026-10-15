
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/core/widgets/validator.dart';
import 'package:bookia/features/auth/ui/registerScreen.dart';
import 'package:bookia/features/auth/ui/widgets/SocialButton.dart';
import 'package:bookia/features/auth/ui/widgets/custom_text_field.dart';
import 'package:bookia/features/auth/ui/widgets/divider.dart';
import 'package:bookia/features/auth/ui/widgets/footer.dart';
import 'package:bookia/features/auth/ui/widgets/header.dart';
import 'package:bookia/features/home/ui/homeScreen.dart';
import 'package:bookia/features/onboarding/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(22.w),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 41.w,
                        height: 41.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: AppColors.outlineGray),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios_new),
                          iconSize: 19.sp,
                          color: AppColors.black,
                        ),
                      ),
                      20.verticalSpace,
                      AuthHeader(
                        title: 'Welcome back! Glad to see you, Again!',
                      ),
                      20.verticalSpace,

                      CustomTextField(
                        hintText: 'Enter your email ',

                        validator: AppValidators.email,
                      ),
                      15.verticalSpace,
                      CustomTextField(
                        hintText: 'Enter your password',
                        obscureText: true,
                        validator: AppValidators.password,
                      ),
                      13.verticalSpace,
                      Text(
                        'Forgot password?',
                        style: AppTextStyles.dmRegular14.copyWith(
                          color: AppColors.mainGray,
                        ),
                      ),

                      30.verticalSpace,
                      OnboardingButton(
                        text: 'Login',
                        backgroundColor: AppColors.gold,
                        foregroundColor: AppColors.white,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          }
                        },
                      ),
                      24.verticalSpace,
                      const AuthDivider(),
                      24.verticalSpace,

                      SocialAuthButton(
                        text: 'Sign Up with Google',
                        backgroundColor: AppColors.white,
                        foregroundColor: AppColors.mainGray,
                        side: BorderSide(color: AppColors.outlineGray),
                        onPressed: () {},
                        imagePath: 'assets/image/logos_google-icon.png',
                      ),
                      15.verticalSpace,
                      SocialAuthButton(
                        text: 'Sign in with Apple',
                        imagePath: 'assets/image/apple.png',
                        backgroundColor: AppColors.white,
                        foregroundColor: AppColors.mainGray,
                        side: BorderSide(color: AppColors.outlineGray),
                        onPressed: () {},
                      ),
                      50.verticalSpace,
                      AuthFooter(
                        message: 'Don’t have an account?',
                        actionText: 'Register Now',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}