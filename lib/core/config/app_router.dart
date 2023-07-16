import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/core/constants/app_routes_name.dart';
import 'package:uber_clone/features/Auth/presentation/screens/login_screen.dart';
import 'package:uber_clone/features/Auth/presentation/screens/otp_screen.dart';
import 'package:uber_clone/features/Auth/presentation/screens/register_screen.dart';
import 'package:uber_clone/features/map/presentation/screens/home_screen.dart';
import 'package:uber_clone/features/map/presentation/screens/map_screen.dart';
import 'package:uber_clone/features/trip/presentation/screens/trip_screen.dart';

import '../../features/Auth/presentation/bloc/auth_bloc.dart';
import '../service/service_locator.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt.get<AuthBloc>(),
                  child: const LoginScreen(),
                ));
      case AppRoutes.otpScreen:
        final phoneNumber = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => OTPScreen(
                  phoneNumber: phoneNumber,
                ));
      case AppRoutes.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case AppRoutes.mapScreen:
        return MaterialPageRoute(
          builder: (_) => const MapScreen(),
        );
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
        case AppRoutes.tripScreen:
        return MaterialPageRoute(
          builder: (_) => const TripScreen(),
        );
    }
    return null;
  }
}
