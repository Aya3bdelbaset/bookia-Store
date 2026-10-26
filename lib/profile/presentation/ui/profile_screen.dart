import 'package:bookia/profile/presentation/ui/widgets/header_profile.dart';
import 'package:bookia/profile/presentation/ui/widgets/infoUser.dart';
import 'package:bookia/profile/presentation/ui/widgets/menu_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ProfileHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      16.verticalSpace,
                      ProfileUserInfo(),
                      35.verticalSpace,
                      ProfileMenuItem(title: 'My Orders', onTap: () {}),
                      ProfileMenuItem(title: 'Edit Profile', onTap: () {}),
                      ProfileMenuItem(title: 'Reset Password', onTap: () {}),
                      ProfileMenuItem(title: 'FAQ', onTap: () {}),
                      ProfileMenuItem(title: 'Contact Us', onTap: () {}),
                      ProfileMenuItem(title: 'Privacy & Terms', onTap: () {}),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}