import 'package:cricket_demo/core/enums/match.dart';
import 'package:cricket_demo/core/error/failure.dart';
import 'package:cricket_demo/features/ranking/data/model/rank_model.dart';
import 'package:cricket_demo/features/ranking/domain/repositories/rank_repository.dart';
import 'package:cricket_demo/features/ranking/domain/usecases/get_data.dart';
import 'package:cricket_demo/features/ranking/domain/usecases/get_local_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rank_event.dart';
part 'rank_state.dart';

class RankBloc extends Bloc<RankEvent, RankState> {
  final GetDataUseCase getDataUseCase;
  final GetLocalDataUseCase getLocalDataUseCase;
  final RankingRepository repository;
  RankBloc(
      {required this.getDataUseCase,
      required this.repository,
      required this.getLocalDataUseCase})
      : super(RankInitial()) {
    on<RankEvent>((event, emit) async {
      if (event is GetDataEvent) {
        emit(RankLoading());
        var res = await getDataUseCase(repository);
        if (res.isLeft()) {
          var result = await getLocalDataUseCase(repository);

          result.fold((failure) async {
            emit(const RankError("Server Failure"));
          }, (success) {
            emit(RankLoaded(
              rankModel: success,
            ));
          });
        }
        res.fold((failure) {
          if (failure is ServerFailure) {
            emit(const RankError("Server Failure"));
          }
        }, (success) {
          emit(RankLoaded(
            rankModel: success,
          ));
        });
      }

      if (event is ChangeRankTypeEvent) {
        emit(RankLoading());
        await Future.delayed(const Duration(microseconds: 1));
        emit(RankLoaded(rankModel: event.rankModel, rankType: event.rankType));
      }

      if (event is ChangeTabEvent) {
        emit(RankLoading());
        await Future.delayed(const Duration(microseconds: 1));
        if (event.index == 0) {
          emit(RankLoaded(
              rankModel: event.rankModel,
              rankType: RankType.ODI_Batsman,
              tabIndex: event.index));
        } else if (event.index == 1) {
          emit(RankLoaded(
              rankModel: event.rankModel,
              rankType: RankType.Test_Batsman,
              tabIndex: event.index));
        } else {
          emit(RankLoaded(
              rankModel: event.rankModel,
              rankType: RankType.T20_Batsman,
              tabIndex: event.index));
        }
      }
    });
  }
}
