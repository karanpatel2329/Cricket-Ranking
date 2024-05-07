import 'package:cricket_demo/core/enums/match.dart';
import 'package:cricket_demo/features/ranking/presentation/UI/widgets/info_card.dart';
import 'package:cricket_demo/features/ranking/presentation/UI/widgets/info_heading_widget.dart';
import 'package:cricket_demo/features/ranking/presentation/UI/widgets/type_buttons.dart';
import 'package:cricket_demo/features/ranking/presentation/bloc/rank_bloc.dart';
import 'package:flutter/material.dart';

class T20Widget extends StatelessWidget {
  const T20Widget({super.key, required this.state});
  final RankLoaded state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        TypeButtonsWidget(state: state,isT20: true,),
        const SizedBox(
          height: 12,
        ),
    InfoHeadingWidget(isTeam:  state.rankType == RankType.T20_Teams,),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: state.rankType == RankType.T20_AllRounder
                ? state.rankModel.responseData?.result?.t20AllRounder!.length
                : state.rankType == RankType.T20_Batsman
                    ? state.rankModel.responseData?.result?.t20Batsman!.length
                    : state.rankType == RankType.T20_Bowlers
                        ? state
                            .rankModel.responseData?.result?.t20Bowler!.length
                        : state.rankType == RankType.T20_Teams
                            ? state.rankModel.responseData?.result?.t20Teams!
                                .length
                            : 0,
            itemBuilder: (context, index) {
              if (state.rankType == RankType.T20_AllRounder) {
                return InfoCardWidget(index: index, rank: state.rankModel.responseData?.result?.t20AllRounder?[index].position.toString()??"", playerName: state.rankModel.responseData?.result?.t20AllRounder?[index].playerName.toString()??"", points: state.rankModel.responseData?.result?.t20AllRounder?[index].points.toString()??"");
              } else if (state.rankType == RankType.T20_Batsman) {
                   return InfoCardWidget(index: index, rank: state.rankModel.responseData?.result?.t20Batsman?[index].position.toString()??"", playerName: state.rankModel.responseData?.result?.t20Batsman?[index].playerName.toString()??"", points: state.rankModel.responseData?.result?.t20Batsman?[index].points.toString()??"");
              } else if (state.rankType == RankType.T20_Bowlers) {
                       return InfoCardWidget(index: index, rank: state.rankModel.responseData?.result?.t20Bowler?[index].position.toString()??"", playerName: state.rankModel.responseData?.result?.t20Bowler?[index].playerName.toString()??"", points: state.rankModel.responseData?.result?.t20Bowler?[index].points.toString()??"");
              } else if (state.rankType == RankType.T20_Teams) {
                          return InfoCardWidget(index: index, rank: state.rankModel.responseData?.result?.t20Teams?[index].position.toString()??"", playerName: state.rankModel.responseData?.result?.t20Teams?[index].teamName?.replaceAll(" ", "").toString()??"", points: state.rankModel.responseData?.result?.t20Teams?[index].points.toString()??"",isTeam: true, rating: state.rankModel.responseData?.result?.t20Teams?[index].rating.toString()??"",);
              }
            
              return const SizedBox();
            },
          ),
        ),  ],
    );
  }
}
