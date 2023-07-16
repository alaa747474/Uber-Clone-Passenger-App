import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_clone/core/config/app_router.dart';

import 'package:uber_clone/core/config/theme.dart';
import 'package:uber_clone/core/service/service_locator.dart';
import 'package:uber_clone/features/trip/data/datasources/trip_remote_data_source.dart';
import 'package:uber_clone/features/trip/data/repositories/trip_repository.dart';
import 'package:uber_clone/features/trip/domain/usecases/save_trip_requests_use_case.dart';
import 'package:uber_clone/features/trip/presentation/bloc/trip_bloc.dart';
import 'core/widgets/loading_screen.dart';
import 'features/Auth/presentation/bloc/auth_bloc.dart';
import 'features/map/presentation/blocs/map_bloc/map_bloc.dart';
import 'firebase_options.dart';

void main() async {
  ServicesLocator().init();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<AuthBloc>()..add(GetUserState()),
        ),
        BlocProvider(
          create: (context) => getIt.get<MapBloc>()..add(GetCurrentPosition()),
        ),
        BlocProvider(
          create: (context) => TripBloc(getIt.get<MapBloc>(),SaveTripRequestsUseCase(TripRepository(TripRemoteDataSource(FirebaseFirestore.instance)))),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Taxi App',
            onGenerateRoute: AppRouter.generateRoute,
            home: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is InitialRouteScreenLoaded) {
                  return state.screen;
                }
                return const Loading();
              },
            ),
            theme: AppTheme.theme()),
      ),
    );
  }
}

