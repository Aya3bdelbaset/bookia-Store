import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/ui/home_screen.dart';
import 'package:bookia/profile/presentation/ui/profile_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNaveBarScreen extends StatefulWidget {
  const BottomNaveBarScreen({super.key});

  @override
  State<BottomNaveBarScreen> createState() => _BottomNaveBarScreenState();
}

class _BottomNaveBarScreenState extends State<BottomNaveBarScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    BlocProvider(
      create: (context) => HomeCubit()
        ..getBestSellerBooks()
        ..getSliders(),
      child: HomeScreen(),
    ),
    BlocProvider(
      create: (context) => HomeCubit()..getBestSellerBooks(),
      child: HomeScreen(),
    ),
    BlocProvider(
      create: (context) => HomeCubit()..getBestSellerBooks(),
      child: HomeScreen(),
    ),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: screens[currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (v) {
            setState(() {
              currentIndex = v;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.backGround,
          selectedItemColor: AppColors.gold,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icon/Home.svg',
                colorFilter: ColorFilter.mode(
                  currentIndex == 0 ? AppColors.gold : AppColors.black,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icon/Bookmark.svg',
                colorFilter: ColorFilter.mode(
                  currentIndex == 1 ? AppColors.gold : AppColors.black,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icon/cart.svg',
                colorFilter: ColorFilter.mode(
                  currentIndex == 2 ? AppColors.gold : AppColors.black,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icon/Profile.svg',
                colorFilter: ColorFilter.mode(
                  currentIndex == 3 ? AppColors.gold : AppColors.black,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}