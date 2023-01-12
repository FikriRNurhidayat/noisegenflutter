// ignore: import_of_legacy_library_into_null_safe
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:noisegenflutter/features/noise/domain/usecases/get_noise.dart';
import 'package:noisegenflutter/features/noise/domain/usecases/get_noises.dart';
import 'package:noisegenflutter/features/noise/presentation/cubit/noise_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/noise/data/datasources/noise_remote_data_source.dart';
import 'features/noise/data/repositories/noise_repository_impl.dart';
import 'features/noise/domain/repository/noise_repository.dart';
import 'features/noise/domain/usecases/create_noise.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(() => NoiseCubit(
        createNoise: sl(),
        getNoises: sl(),
        getNoise: sl(),
      ));

  // Use cases
  sl.registerLazySingleton<CreateNoise>(() => CreateNoise(sl()));
  sl.registerLazySingleton<GetNoises>(() => GetNoises(sl()));
  sl.registerLazySingleton<GetNoise>(() => GetNoise(sl()));

  // Repository
  sl.registerLazySingleton<NoiseRepository>(
    () => NoiseRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<NoiseRemoteDataSource>(
    () => NoiseRemoteDataSourceImpl(client: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
