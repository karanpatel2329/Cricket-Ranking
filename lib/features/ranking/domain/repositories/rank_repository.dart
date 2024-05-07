import 'package:cricket_demo/core/error/failure.dart';
import 'package:cricket_demo/features/ranking/data/model/rank_model.dart';
import 'package:dartz/dartz.dart';

abstract class RankingRepository {
  Future<Either<Failure, RankModel>> getData();
  Future<Either<Failure, RankModel>> fetchCachedRanking();
}