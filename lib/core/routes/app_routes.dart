import 'package:bookia/buttom-nav-bar/presentation/buttom_nav_screen.dart';
import 'package:bookia/core/routes/routes_name.dart';
import 'package:bookia/features/auth/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/repo/auth_repo.dart';
import 'package:bookia/features/auth/ui/loginScreen.dart';
import 'package:bookia/features/auth/ui/registerScreen.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/ui/home_screen.dart';
import 'package:bookia/features/home/presentation/ui/search_screen.dart';
import 'package:bookia/features/onboarding/ui/onboadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.onbordingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(AuthRepo()),
            child: LoginScreen(),
          ),
        );

      case AppRoutes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(AuthRepo()),
            child: RegisterScreen(),
          ),
        );
      case AppRoutes.bottumNavScreen:
        return MaterialPageRoute(builder: (_) => BottomNaveBarScreen());

      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => HomeCubit()
              ..getBestSellerBooks()
              ..getSliders(),
            child: HomeScreen(),
          ),
        );
      case AppRoutes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit()..search(""),
            child: SearchScreen(),
          ),
        );

      default:
        return null;
    }
  }
}