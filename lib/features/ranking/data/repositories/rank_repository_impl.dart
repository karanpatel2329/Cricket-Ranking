
import 'package:cricket_demo/core/error/execptions.dart';
import 'package:cricket_demo/core/error/failure.dart';
import 'package:cricket_demo/features/ranking/data/datasources/rank_local_datasource.dart';
import 'package:cricket_demo/features/ranking/data/datasources/rank_remote_datasource.dart';
import 'package:cricket_demo/features/ranking/data/model/rank_model.dart';
import 'package:cricket_demo/features/ranking/domain/repositories/rank_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
class RankRepositoryImpl implements RankingRepository {
  final RankingRemoteDataSource remoteDataSource;
  final RankingLocalDataSource localDataSource;

  RankRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
});

  @override
  Future<Either<Failure, RankModel>> getData() async {
    bool hasInternet = await InternetConnection().hasInternetAccess;
    if (hasInternet) {
      try {
        final remoteData = await remoteDataSource.getData();
        localDataSource.cacheRanking(remoteData);
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, RankModel>> fetchCachedRanking() async {
    try {
      final localData = await localDataSource.getLastRanking();
      return Right(localData);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}