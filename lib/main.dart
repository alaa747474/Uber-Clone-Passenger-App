import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/core/config/theme.dart';
import 'package:uber_clone/features/Auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:uber_clone/features/Auth/data/repositories/auth_repository.dart';
import 'package:uber_clone/features/Auth/domain/usecases/verify_otp_use_case.dart';
import 'package:uber_clone/features/Auth/domain/usecases/verify_phone_use_case.dart';
import 'package:uber_clone/features/Auth/presentation/screens/login_screen.dart';

import 'features/Auth/presentation/bloc/auth_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => BlocProvider(
              create: (context) => AuthBloc(
                  VerifyOTPUseCase(AuthRepository(
                      AuthRemoteDataSource(FirebaseAuth.instance))),
                  VerifyPhoneUseCase(AuthRepository(
                      AuthRemoteDataSource(FirebaseAuth.instance))),
                  FirebaseAuth.instance),
              child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Taxi App',
                  home: const LoginScreen(),
                  theme: AppTheme.theme()),

            ));
  }
}
