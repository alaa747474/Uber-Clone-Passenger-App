import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:uber_clone/features/Auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:uber_clone/features/Auth/data/repositories/auth_repository.dart';
import 'package:uber_clone/features/Auth/domain/repositories/base_auth_repository.dart';
import 'package:uber_clone/features/Auth/domain/usecases/get_image_url_use_case.dart';
import 'package:uber_clone/features/Auth/domain/usecases/get_user_state_use_case.dart';
import 'package:uber_clone/features/Auth/domain/usecases/save_user_information_use_case.dart';
import 'package:uber_clone/features/Auth/domain/usecases/verify_otp_use_case.dart';
import 'package:uber_clone/features/Auth/domain/usecases/verify_phone_use_case.dart';
import 'package:uber_clone/features/Auth/presentation/bloc/auth_bloc.dart';

GetIt getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    // BLOCS
    getIt.registerLazySingleton(() => AuthBloc(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
          getIt(),
          FirebaseAuth.instance
        ));

    // USE CASES
    getIt.registerLazySingleton(() => SaveUserInformationUseCase(getIt()));
    getIt.registerLazySingleton(() => VerifyOTPUseCase(getIt()));
    getIt.registerLazySingleton(() => VerifyPhoneUseCase(getIt()));
    getIt.registerLazySingleton(() => GetImageUrlUseCase(getIt()));
    getIt.registerLazySingleton(() => GetUserStateUseCase(getIt()));

    // REPOSITORIES
    getIt.registerLazySingleton<BaseAuthRepository>(
      () => AuthRepository(
        getIt(),
      ),
    );

    // DATA SOURCES
    getIt.registerLazySingleton<BaseAuthRemoteDataSource>(
      () => AuthRemoteDataSource(FirebaseAuth.instance,
          FirebaseFirestore.instance, FirebaseStorage.instance),
    );
  }
}
