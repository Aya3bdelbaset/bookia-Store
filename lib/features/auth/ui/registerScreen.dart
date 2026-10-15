
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/widgets/validator.dart';
import 'package:bookia/features/auth/ui/loginScreen.dart';
import 'package:bookia/features/auth/ui/widgets/custom_text_field.dart';
import 'package:bookia/features/auth/ui/widgets/footer.dart';
import 'package:bookia/features/auth/ui/widgets/header.dart';
import 'package:bookia/features/home/ui/homeScreen.dart';
import 'package:bookia/features/onboarding/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
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
                      AuthHeader(title: 'Hello! Register to get started'),
                      20.verticalSpace,

                      CustomTextField(
                        hintText: 'Username ',

                        validator: AppValidators.fullName,
                      ),
                      15.verticalSpace,
                      CustomTextField(
                        hintText: 'Email ',
                        validator: AppValidators.email,
                      ),
                      15.verticalSpace,
                      CustomTextField(
                        hintText: 'Password',
                        obscureText: true,
                        validator: AppValidators.password,
                      ),
                      15.verticalSpace,
                      CustomTextField(
                        hintText: 'Confirm password',
                        obscureText: true,
                        validator: AppValidators.password,
                      ),

                      30.verticalSpace,
                      OnboardingButton(
                        text: 'Register',
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

                      90.verticalSpace,
                      AuthFooter(
                        message: 'Don’t have an account?',
                        actionText: 'Login Now',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
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