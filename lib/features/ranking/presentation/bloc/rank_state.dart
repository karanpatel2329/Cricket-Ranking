part of 'rank_bloc.dart';

sealed class RankState extends Equatable {
  const RankState();
  
  @override
  List<Object> get props => [];
}

final class RankInitial extends RankState {}

final class RankLoading extends RankState {}

final class RankLoaded extends RankState {
  final RankModel rankModel;
  final RankType rankType;
  final int tabIndex;
  const RankLoaded({required this.rankModel, this.rankType=RankType.ODI_Batsman, this.tabIndex=0});

  @override
  List<Object> get props => [rankModel];
}

final class RankError extends RankState {
  final String message;

  const RankError(this.message);

  @override
  List<Object> get props => [message];
}