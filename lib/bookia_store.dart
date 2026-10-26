import 'package:bookia/core/routes/app_routes.dart';
import 'package:bookia/core/routes/routes_name.dart';
import 'package:bookia/core/services/locale/local_helper.dart';
import 'package:bookia/core/theme/app_colors.dart';
import 'package:bookia/core/utils/const_app.dart';
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
          scaffoldBackgroundColor: AppColors.backGround,
          fontFamily: 'Dm',
        ),
        initialRoute: 
        // intiPage(),
        AppRoutes.bottumNavScreen,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }

  String intiPage() {
    if (LocalHelper.prefs?.getString(AppConst.userToken) != null) {
      return AppRoutes.bottumNavScreen;
    } else {
      return AppRoutes.onbordingScreen;
    }
  }
}