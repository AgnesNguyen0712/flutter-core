import 'package:flutter_core/screens/example/blocs/example_lst_view_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/api_provider.dart';
import 'core/utils/constants.dart';
import 'data/repositories/example_repository_impl.dart';
import 'data/sources/local/example_local.dart';
import 'data/sources/local/storage_local.dart';
import 'data/sources/remote/example_remote.dart';
import 'domain/repositories/example_repository.dart';
import 'domain/usecases/example_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  sl.registerLazySingleton(() => http.Client());
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // Core
  sl.registerLazySingleton(() => ApiProvider(sl()));

  // Data sources
  sl.registerLazySingleton<ExampleRemote>(
    () => ExampleRemoteImpl(sl(), Constants.exampleUrl),
  );
  sl.registerLazySingleton<ExampleLocal>(
    () => ExampleMockLocalImpl(),
  );

  sl.registerLazySingleton<StorageLocal>(
    () => StorageLocalImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<ExampleRepository>(
    () => ExampleRepositoryImplement(sl(), sl(), false),
  );

  // Use cases
  sl.registerLazySingleton(() => ExampleUseCase(sl()));



  // Bloc
  sl.registerFactory(
    () => ExampleLstViewBloc(sl()),
  );

}
