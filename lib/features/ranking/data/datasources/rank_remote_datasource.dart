import 'dart:convert';

import 'package:cricket_demo/core/error/execptions.dart';
import 'package:cricket_demo/features/ranking/data/model/rank_model.dart';
import 'package:flutter/services.dart';

abstract class RankingRemoteDataSource {
  Future<RankModel> getData();
}

class RankingRemoteDataSourceImpl extends RankingRemoteDataSource {


  RankingRemoteDataSourceImpl();

  @override
  Future<RankModel> getData() async {
    final response = await mockAPICalling();
    RankModel rankModel = RankModel.fromJson(response);
    if (rankModel.statusCode != 1) {
      throw ServerException();
    }
    return rankModel;
  }

  Future mockAPICalling() async {
    await Future.delayed(const Duration(milliseconds: 20));
    final String response =
        await rootBundle.loadString('assets/data/test.json');
    final data = await json.decode(response);
    return data;
  }
}
