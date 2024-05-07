import 'package:cricket_demo/core/enums/match.dart';
import 'package:cricket_demo/features/ranking/presentation/UI/widgets/button.dart';
import 'package:cricket_demo/features/ranking/presentation/bloc/rank_bloc.dart';
import 'package:flutter/material.dart';

class TypeButtonsWidget extends StatelessWidget {
  const TypeButtonsWidget({
    super.key,
    required this.state,
    this.isODI=false,
    this.isT20=false,
    this.isTest=false,
  });
  final bool isT20;
  final bool isODI;
  final bool isTest;

  final RankLoaded state;

  @override
  Widget build(BuildContext context) {
    if(isODI){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RankTypeButton(
          state: state,
          currentRankType: RankType.ODI_Batsman,
          title: "Batsman",
        ),
        RankTypeButton(
          state: state,
          currentRankType: RankType.ODI_Bowlers,
          title: "Bowlers",
        ),
        RankTypeButton(
          state: state,
          currentRankType: RankType.ODI_AllRounder,
          title: "All Rounder",
        ),
        RankTypeButton(
          state: state,
          currentRankType: RankType.ODI_Teams,
          title: "Teams",
        ),
      ],
    );
    }
    if(isT20){
       return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RankTypeButton(
              state: state,
              currentRankType: RankType.T20_Batsman,
              title: "Batsman",
            ),
            RankTypeButton(
              state: state,
              currentRankType: RankType.T20_Bowlers,
              title: "Bowlers",
            ),
            RankTypeButton(
              state: state,
              currentRankType: RankType.T20_AllRounder,
              title: "All Rounder",
            ),
            RankTypeButton(
              state: state,
              currentRankType: RankType.T20_Teams,
              title: "Teams",
            ),
          ],
        );
   
    }
    if(isTest){
         return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RankTypeButton(
              state: state,
              currentRankType: RankType.Test_Batsman,
              title: "Batsman",
            ),
            RankTypeButton(
              state: state,
              currentRankType: RankType.Test_Bowlers,
              title: "Bowlers",
            ),
            RankTypeButton(
              state: state,
              currentRankType: RankType.Test_AllRounder,
              title: "All Rounder",
            ),
            RankTypeButton(
              state: state,
              currentRankType: RankType.Test_Teams,
              title: "Teams",
            ),
          ],
        );
    
    }
    
  return SizedBox();
  }
}
