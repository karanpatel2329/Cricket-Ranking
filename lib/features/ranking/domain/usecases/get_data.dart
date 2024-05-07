import 'package:cricket_demo/core/error/failure.dart';
import 'package:cricket_demo/core/usecases/usecase.dart';
import 'package:cricket_demo/features/ranking/data/model/rank_model.dart';
import 'package:cricket_demo/features/ranking/domain/repositories/rank_repository.dart';
import 'package:dartz/dartz.dart';

class GetDataUseCase extends UseCase<RankModel, void> {
  final RankingRepository repository;

  GetDataUseCase(this.repository);
  
  @override
  Future<Either<Failure, RankModel>> call(void params) {
    return repository.getData();
  }

  
}