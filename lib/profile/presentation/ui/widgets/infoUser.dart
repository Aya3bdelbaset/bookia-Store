import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
            color: AppColors.gray,
            shape: BoxShape.circle,
          ),
        ),
        13.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Aya Abdelbaset',
                style: AppTextStyles.dmRegular20.copyWith(
                  color: AppColors.black,
                ),
              ),
              6.verticalSpace,
              Text(
                'aya@gmail.com',
                style: AppTextStyles.dmRegular14.copyWith(
                  color: AppColors.gray80,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}