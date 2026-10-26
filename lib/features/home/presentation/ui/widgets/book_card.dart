import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:bookia/features/home/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookCard extends StatelessWidget {
  final Products? product;
  const BookCard({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.outlineGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Image.network(
                product?.image ?? "",
                width: 140.w,
                height: 175.h,
                fit: BoxFit.contain,
              ),
            ),
          ),

          8.verticalSpace,

          Text(
            product?.name ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.dmRegular18.copyWith(color: AppColors.black),
          ),

          8.verticalSpace,

          Row(
            children: [
              Expanded(
                child: Text(
                  product?.price ?? "",
                  style: AppTextStyles.dmRegular15.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),

              SizedBox(
                height: 28.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF292929),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  child: Text(
                    'Buy',
                    style: AppTextStyles.dmRegular14.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}