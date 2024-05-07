
import 'package:cricket_demo/core/enums/match.dart';
import 'package:cricket_demo/features/ranking/presentation/UI/widgets/info_card.dart';
import 'package:cricket_demo/features/ranking/presentation/UI/widgets/info_heading_widget.dart';
import 'package:cricket_demo/features/ranking/presentation/UI/widgets/type_buttons.dart';
import 'package:cricket_demo/features/ranking/presentation/bloc/rank_bloc.dart';
import 'package:flutter/material.dart';

class ODIWidget extends StatelessWidget {
  const ODIWidget({super.key, required this.state});
  final RankLoaded state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        TypeButtonsWidget(state: state,isODI: true,),
        const SizedBox(
          height: 12,
        ),
        InfoHeadingWidget(isTeam:  state.rankType == RankType.ODI_Teams,),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: state.rankType == RankType.ODI_AllRounder
                ? state.rankModel.responseData?.result?.odiAllRounder!.length
                : state.rankType == RankType.ODI_Batsman
                    ? state.rankModel.responseData?.result?.odiBatsman!.length
                    : state.rankType == RankType.ODI_Bowlers
                        ? state
                            .rankModel.responseData?.result?.odiBowler!.length
                        : state.rankType == RankType.ODI_Teams
                            ? state.rankModel.responseData?.result?.odiTeams!
                                .length
                            : 0,
            itemBuilder: (context, index) {
              if (state.rankType == RankType.ODI_AllRounder) {
                return InfoCardWidget(index: index, rank: state.rankModel.responseData?.result?.odiAllRounder?[index].position.toString()??"", playerName: state.rankModel.responseData?.result?.odiAllRounder?[index].playerName.toString()??"", points: state.rankModel.responseData?.result?.odiAllRounder?[index].points.toString()??"");
              } else if (state.rankType == RankType.ODI_Batsman) {
                   return InfoCardWidget(index: index, rank: state.rankModel.responseData?.result?.odiBatsman?[index].position.toString()??"", playerName: state.rankModel.responseData?.result?.odiBatsman?[index].playerName.toString()??"", points: state.rankModel.responseData?.result?.odiBatsman?[index].points.toString()??"");
              } else if (state.rankType == RankType.ODI_Bowlers) {
                       return InfoCardWidget(index: index, rank: state.rankModel.responseData?.result?.odiBowler?[index].position.toString()??"", playerName: state.rankModel.responseData?.result?.odiBowler?[index].playerName.toString()??"", points: state.rankModel.responseData?.result?.odiBowler?[index].points.toString()??"");
              } else if (state.rankType == RankType.ODI_Teams) {
                          return InfoCardWidget(index: index, rank: state.rankModel.responseData?.result?.odiTeams?[index].position.toString()??"", playerName: state.rankModel.responseData?.result?.odiTeams?[index].teamName?.replaceAll(" ", "").toString()??"", points: state.rankModel.responseData?.result?.odiTeams?[index].points.toString()??"",isTeam: true, rating: state.rankModel.responseData?.result?.odiTeams?[index].rating.toString()??"",);
              }
              
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}



