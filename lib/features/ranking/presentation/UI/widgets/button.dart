import 'package:cricket_demo/core/constants/colors.dart';
import 'package:cricket_demo/core/enums/match.dart';
import 'package:cricket_demo/features/ranking/presentation/bloc/rank_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RankTypeButton extends StatelessWidget {
  const RankTypeButton({
    super.key,
    required this.state,
    required this.currentRankType,
    required this.title,

  });
  final RankLoaded state;
  final RankType currentRankType;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        BlocProvider.of<RankBloc>(context).add(ChangeRankTypeEvent(rankModel: state.rankModel,rankType:currentRankType));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
           color:state.rankType==currentRankType? AppColors.btnBG:Colors.transparent,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Text(title, style: TextStyle(color:state.rankType==currentRankType? AppColors.white:AppColors.black),),
      
      ),
    );
  }
}
