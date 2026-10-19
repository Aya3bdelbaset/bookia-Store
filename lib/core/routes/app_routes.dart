import 'package:bookia/core/routes/routes_name.dart';
import 'package:bookia/features/auth/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/repo/auth_repo.dart';
import 'package:bookia/features/auth/ui/loginScreen.dart';
import 'package:bookia/features/auth/ui/registerScreen.dart';
import 'package:bookia/features/onboarding/ui/onboadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AppRouter {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.onbordingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(AuthRepo()),
            child: RegisterScreen(),
          ),
        );
    }
    return null;
  }
}