
import 'package:cricket_demo/core/constants/colors.dart';
import 'package:flutter/material.dart';

class InfoHeadingWidget extends StatelessWidget {
  const InfoHeadingWidget({
    super.key,
    required this.isTeam,
  });
  final bool isTeam;

  @override
  Widget build(BuildContext context) {
    if(isTeam){
   return Container(
      color: AppColors.grey,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: const Text(
                "Rank",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.32,
              child: const Text(
                "Teams",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              SizedBox(
              width: MediaQuery.of(context).size.width * 0.22,
              child: const Text(
                "Ratings",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: const Text(
                "Points",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
 
    }
    return Container(
      color: AppColors.grey,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: const Text(
                "Rank",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.54,
              child: const Text(
                "Players",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: const Text(
                "Points",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
