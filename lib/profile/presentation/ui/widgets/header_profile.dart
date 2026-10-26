import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: SizedBox(
        height: 40.h,
        child: Row(
          children: [
            const Spacer(),
            Center(
              child: Text(
                'Profile',
                style: AppTextStyles.dmRegular24.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icon/Logout.svg'),
            ),
          ],
        ),
      ),
    );
  }
}