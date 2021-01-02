import 'package:FizzBuzzTest/core/platform/network_info.dart';
import 'package:FizzBuzzTest/feature/number_random/data/datasources/local_number_random_datasource.dart';
import 'package:FizzBuzzTest/feature/number_random/data/datasources/remote_numote_random_datasource.dart';
import 'package:FizzBuzzTest/feature/number_random/data/repositories/number_random_repository_impl.dart';
import 'package:FizzBuzzTest/feature/number_random/domain/repositories/number_randon_repository.dart';
import 'package:FizzBuzzTest/feature/number_random/domain/usecases/get_number_random.dart';
import 'package:FizzBuzzTest/feature/number_random/presentation/bloc/number_random_bo_c_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final instance = GetIt.instance;

Future<void> init() async {
  ///Feature
  instance.registerFactory(() => NumberRandomBoCBloc(instance()));

  ///User Case
  instance.registerLazySingleton(() => GetNumberRandom(instance()));

  ///Repository
  instance.registerLazySingleton<NumberRandomRepository>(() =>
      NumberRandomRepositoryImpl(
          remoteDataSource: instance(),
          networkInfo: instance(),
          localDataSource: instance()));

  ///Datasource
  instance.registerLazySingleton<LocalNumberRandomDataSource>(
      () => LocalNumberRandomDataSourceImpl());
  instance.registerLazySingleton<NumberRandomRemoteDatasource>(
      () => NumberRandomRemoteDataSourceImpl(client: instance()));

  ///Core
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(dataConnectionChecker: instance()));

  ///External
  instance.registerLazySingleton(() => http.Client());
  instance.registerLazySingleton(() => DataConnectionChecker());
}
