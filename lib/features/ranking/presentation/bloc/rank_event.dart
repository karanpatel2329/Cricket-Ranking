part of 'rank_bloc.dart';

sealed class RankEvent extends Equatable {
  const RankEvent();

  @override
  List<Object> get props => [];
}


class GetDataEvent extends RankEvent {
  const GetDataEvent();
}

class ChangeRankTypeEvent extends RankEvent {
  final RankModel rankModel;
  final RankType rankType;

  const ChangeRankTypeEvent({required this.rankModel,required this.rankType});

  @override
  List<Object> get props => [rankModel,rankType];
}

class ChangeTabEvent extends RankEvent {
  final RankModel rankModel;
  final int index;

  const ChangeTabEvent({required this.rankModel,required this.index});

  @override
  List<Object> get props => [rankModel,index];
}