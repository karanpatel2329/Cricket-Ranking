import 'dart:convert';

import 'package:cricket_demo/core/error/execptions.dart';
import 'package:cricket_demo/features/ranking/data/model/rank_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RankingLocalDataSource {
  Future<RankModel> getLastRanking();
  Future<void> cacheRanking(RankModel rankModel);
}

class RankingLocalDataSourceImpl extends RankingLocalDataSource {
  final SharedPreferences sharedPreferences;

 RankingLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheRanking(RankModel rankModel) {
    return sharedPreferences.setString("ranking", jsonEncode(rankModel));
  }

  @override
  Future<RankModel> getLastRanking() {
    String? jsonStr = sharedPreferences.getString("ranking");
    if (jsonStr == null) {
      throw CacheException();
    }
    return Future.value(RankModel.fromJson(jsonDecode(jsonStr)));
  }
}