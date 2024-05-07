
import 'package:cricket_demo/features/ranking/data/datasources/rank_local_datasource.dart';
import 'package:cricket_demo/features/ranking/data/datasources/rank_remote_datasource.dart';
import 'package:cricket_demo/features/ranking/data/repositories/rank_repository_impl.dart';
import 'package:cricket_demo/features/ranking/domain/repositories/rank_repository.dart';
import 'package:cricket_demo/features/ranking/domain/usecases/get_data.dart';
import 'package:cricket_demo/features/ranking/domain/usecases/get_local_data.dart';
import 'package:cricket_demo/features/ranking/presentation/bloc/rank_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


final sl = GetIt.instance; //sl is referred to as Service Locator

//Dependency injection
Future<void> init() async {
  //Blocs
  sl.registerFactory(
    () => RankBloc(getDataUseCase: sl(), repository: sl(), getLocalDataUseCase: sl()),
  );
 
  

  //Use cases
  sl.registerLazySingleton(() => GetDataUseCase(sl()));
  sl.registerLazySingleton(() => GetLocalDataUseCase(sl()));

  //Repositories
  sl.registerLazySingleton<RankingRepository>(
    () => RankRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );


  //Data sources
  sl.registerLazySingleton<RankingRemoteDataSource>(
    () => RankingRemoteDataSourceImpl(
    ),
  );
  sl.registerLazySingleton<RankingLocalDataSource>(
    () => RankingLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
  

  //External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
