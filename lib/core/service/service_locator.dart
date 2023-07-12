import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:uber_clone/core/service/api_helper.dart';
import '../../features/Auth/auth.dart';
import '../../features/Auth/domain/repositories/base_auth_repository.dart';
import '../../features/Auth/presentation/bloc/auth_bloc.dart';
import '../../features/map/data/datasources/trip_remote_data_source.dart';
import '../../features/map/data/repositories/trip_repository.dart';
import '../../features/map/domain/repositories/base_trip_repository.dart';
import '../../features/map/domain/usecases/get_place_details_use_case.dart';
import '../../features/map/domain/usecases/get_place_directions_use_case.dart';
import '../../features/map/domain/usecases/get_place_suggestions_use_case.dart';
import '../../features/map/presentation/blocs/map_bloc/map_bloc.dart';

GetIt getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    //DIO HELEPER
    getIt.registerLazySingleton(() => DioHelper(Dio()));
    // BLOCS
    getIt.registerLazySingleton(() => AuthBloc(
        getIt(), getIt(), getIt(), getIt(), getIt(), FirebaseAuth.instance));
    getIt.registerLazySingleton(() =>MapBloc(getIt(),getIt(),getIt()) );

    // USE CASES
    getIt.registerLazySingleton(() => SaveUserInformationUseCase(getIt()));
    getIt.registerLazySingleton(() => VerifyOTPUseCase(getIt()));
    getIt.registerLazySingleton(() => VerifyPhoneUseCase(getIt()));
    getIt.registerLazySingleton(() => GetImageUrlUseCase(getIt()));
    getIt.registerLazySingleton(() => GetUserStateUseCase(getIt()));
    getIt.registerLazySingleton(() => GetPlaceSuggestionsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetPlaceDetailsUseCase(getIt()));
     getIt.registerLazySingleton(() => GetPlaceDirectionsUseCase(getIt()));


    // REPOSITORIES
    getIt.registerLazySingleton<BaseAuthRepository>(
      () => AuthRepository(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<BaseMapRepository>(
      () => MapRepository(
        getIt(),
      ),
    );

    // DATA SOURCES
    getIt.registerLazySingleton<BaseAuthRemoteDataSource>(
      () => AuthRemoteDataSource(FirebaseAuth.instance,
          FirebaseFirestore.instance, FirebaseStorage.instance),
    );
    getIt.registerLazySingleton<MapRemoteDataSource>(
        () => MapRemoteDataSourceImpl(getIt()));
  }
}
