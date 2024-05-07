import 'package:cricket_demo/core/constants/colors.dart';
import 'package:flutter/material.dart';

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget({super.key,required this.index,required this.rank,required this.playerName,required this.points, this.isTeam=false, this.rating= "0.0"});
  final int index;
  final String rank;
  final String playerName;
  final String points;
  final String rating ;
  final bool isTeam;

  @override
  Widget build(BuildContext context) {
    if(isTeam){
      return Container(
                  color: index % 2 == 0 ? Colors.transparent : AppColors.grey,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Text(
                            rank,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.32,
                          child: Text(
                            playerName,
                          )),
                          SizedBox(
                          width: MediaQuery.of(context).size.width * 0.22,
                          child: Text(
                            rating,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.18,
                          child: Text(
                           points,
                          )),
                    ],
                  ),
                );
    }
    return Container(
                  color: index % 2 == 0 ? Colors.transparent : AppColors.grey,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Text(
                            rank,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.54,
                          child: Text(
                            playerName,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.18,
                          child: Text(
                           points,
                          )),
                    ],
                  ),
                );
                
  }
}