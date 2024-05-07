import 'package:cricket_demo/core/enums/match.dart';
import 'package:cricket_demo/features/ranking/presentation/UI/widgets/info_card.dart';
import 'package:cricket_demo/features/ranking/presentation/UI/widgets/info_heading_widget.dart';
import 'package:cricket_demo/features/ranking/presentation/UI/widgets/type_buttons.dart';
import 'package:cricket_demo/features/ranking/presentation/bloc/rank_bloc.dart';
import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key, required this.state});
  final RankLoaded state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        TypeButtonsWidget(state: state,isTest: true,),
        const SizedBox(
          height: 12,
        ),
     InfoHeadingWidget(isTeam:  state.rankType == RankType.Test_Teams,),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: state.rankType == RankType.Test_AllRounder
                ? state.rankModel.responseData?.result?.testAllRounder!.length
                : state.rankType == RankType.Test_Batsman
                    ? state.rankModel.responseData?.result?.testBatsman!.length
                    : state.rankType == RankType.Test_Bowlers
                        ? state
                            .rankModel.responseData?.result?.testBowler!.length
                        : state.rankType == RankType.Test_Teams
                            ? state.rankModel.responseData?.result?.testTeams!
                                .length
                            : 0,
            itemBuilder: (context, index) {
              if (state.rankType == RankType.Test_AllRounder) {
                return InfoCardWidget(index: index, rank: state.rankModel.responseData?.result?.testAllRounder?[index].position.toString()??"", playerName: state.rankModel.responseData?.result?.testAllRounder?[index].playerName.toString()??"", points: state.rankModel.responseData?.result?.testAllRounder?[index].points.toString()??"");
              } else if (state.rankType == RankType.Test_Batsman) {
                   return InfoCardWidget(index: index, rank: state.rankModel.responseData?.result?.testBatsman?[index].position.toString()??"", playerName: state.rankModel.responseData?.result?.testBatsman?[index].playerName.toString()??"", points: state.rankModel.responseData?.result?.testBatsman?[index].points.toString()??"");
              } else if (state.rankType == RankType.Test_Bowlers) {
                       return InfoCardWidget(index: index, rank: state.rankModel.responseData?.result?.testBowler?[index].position.toString()??"", playerName: state.rankModel.responseData?.result?.testBowler?[index].playerName.toString()??"", points: state.rankModel.responseData?.result?.testBowler?[index].points.toString()??"");
              } else if (state.rankType == RankType.Test_Teams) {
                          return InfoCardWidget(index: index, rank: state.rankModel.responseData?.result?.testTeams?[index].position.toString()??"", playerName: state.rankModel.responseData?.result?.testTeams?[index].teamName?.replaceAll(" ", "").toString()??"", points: state.rankModel.responseData?.result?.testTeams?[index].points.toString()??"",isTeam: true, rating: state.rankModel.responseData?.result?.testTeams?[index].rating.toString()??"",);
              }
              return const SizedBox();
            },
          ),
        ),   ],
    );
  }
}
