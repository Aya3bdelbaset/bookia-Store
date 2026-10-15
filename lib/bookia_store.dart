import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/routes/routes_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookiaApp extends StatelessWidget {
  const BookiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF7F8F9),
          fontFamily: 'Dm',
        ),
        initialRoute: AppRoutes.onbordingScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}