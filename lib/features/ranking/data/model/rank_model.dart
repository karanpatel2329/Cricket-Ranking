// To parse this JSON data, do
//
//     final rankModel = rankModelFromJson(jsonString);

import 'dart:convert';

RankModel rankModelFromJson(String str) => RankModel.fromJson(json.decode(str));

String rankModelToJson(RankModel data) => json.encode(data.toJson());

class RankModel {
    int? statusCode;
    ResponseData? responseData;

    RankModel({
        this.statusCode,
        this.responseData,
    });

    factory RankModel.fromJson(Map<String, dynamic> json) => RankModel(
        statusCode: json["statusCode"],
        responseData: json["responseData"] == null ? null : ResponseData.fromJson(json["responseData"]),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "responseData": responseData?.toJson(),
    };
}

class ResponseData {
    String? message;
    Result? result;

    ResponseData({
        this.message,
        this.result,
    });

    factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
        message: json["message"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "result": result?.toJson(),
    };
}

class Result {
    List<Team>? odiTeams;
    List<Team>? testTeams;
    List<Team>? t20Teams;
    List<Player>? odiBatsman;
    List<Player>? odiBowler;
    List<Player>? odiAllRounder;
    List<Player>? testBatsman;
    List<Player>? testBowler;
    List<Player>? testAllRounder;
    List<Player>? t20Batsman;
    List<Player>? t20Bowler;
    List<Player>? t20AllRounder;

    Result({
        this.odiTeams,
        this.testTeams,
        this.t20Teams,
        this.odiBatsman,
        this.odiBowler,
        this.odiAllRounder,
        this.testBatsman,
        this.testBowler,
        this.testAllRounder,
        this.t20Batsman,
        this.t20Bowler,
        this.t20AllRounder,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        odiTeams: json["odiTeams"] == null ? [] : List<Team>.from(json["odiTeams"]!.map((x) => Team.fromJson(x))),
        testTeams: json["testTeams"] == null ? [] : List<Team>.from(json["testTeams"]!.map((x) => Team.fromJson(x))),
        t20Teams: json["t20Teams"] == null ? [] : List<Team>.from(json["t20Teams"]!.map((x) => Team.fromJson(x))),
        odiBatsman: json["odiBatsman"] == null ? [] : List<Player>.from(json["odiBatsman"]!.map((x) => Player.fromJson(x))),
        odiBowler: json["odiBowler"] == null ? [] : List<Player>.from(json["odiBowler"]!.map((x) => Player.fromJson(x))),
        odiAllRounder: json["odiAllRounder"] == null ? [] : List<Player>.from(json["odiAllRounder"]!.map((x) => Player.fromJson(x))),
        testBatsman: json["testBatsman"] == null ? [] : List<Player>.from(json["testBatsman"]!.map((x) => Player.fromJson(x))),
        testBowler: json["testBowler"] == null ? [] : List<Player>.from(json["testBowler"]!.map((x) => Player.fromJson(x))),
        testAllRounder: json["testAllRounder"] == null ? [] : List<Player>.from(json["testAllRounder"]!.map((x) => Player.fromJson(x))),
        t20Batsman: json["t20Batsman"] == null ? [] : List<Player>.from(json["t20Batsman"]!.map((x) => Player.fromJson(x))),
        t20Bowler: json["t20Bowler"] == null ? [] : List<Player>.from(json["t20Bowler"]!.map((x) => Player.fromJson(x))),
        t20AllRounder: json["t20AllRounder"] == null ? [] : List<Player>.from(json["t20AllRounder"]!.map((x) => Player.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "odiTeams": odiTeams == null ? [] : List<dynamic>.from(odiTeams!.map((x) => x.toJson())),
        "testTeams": testTeams == null ? [] : List<dynamic>.from(testTeams!.map((x) => x.toJson())),
        "t20Teams": t20Teams == null ? [] : List<dynamic>.from(t20Teams!.map((x) => x.toJson())),
        "odiBatsman": odiBatsman == null ? [] : List<dynamic>.from(odiBatsman!.map((x) => x.toJson())),
        "odiBowler": odiBowler == null ? [] : List<dynamic>.from(odiBowler!.map((x) => x.toJson())),
        "odiAllRounder": odiAllRounder == null ? [] : List<dynamic>.from(odiAllRounder!.map((x) => x.toJson())),
        "testBatsman": testBatsman == null ? [] : List<dynamic>.from(testBatsman!.map((x) => x.toJson())),
        "testBowler": testBowler == null ? [] : List<dynamic>.from(testBowler!.map((x) => x.toJson())),
        "testAllRounder": testAllRounder == null ? [] : List<dynamic>.from(testAllRounder!.map((x) => x.toJson())),
        "t20Batsman": t20Batsman == null ? [] : List<dynamic>.from(t20Batsman!.map((x) => x.toJson())),
        "t20Bowler": t20Bowler == null ? [] : List<dynamic>.from(t20Bowler!.map((x) => x.toJson())),
        "t20AllRounder": t20AllRounder == null ? [] : List<dynamic>.from(t20AllRounder!.map((x) => x.toJson())),
    };
}

class Player {
    String? playerName;
    int? position;
    int? points;
    String? team;
    int? matchType;
    int? playerType;
    int? status;

    Player({
        this.playerName,
        this.position,
        this.points,
        this.team,
        this.matchType,
        this.playerType,
        this.status,
    });

    factory Player.fromJson(Map<String, dynamic> json) => Player(
        playerName: json["player_name"],
        position: json["position"],
        points: json["points"],
        team: json["team"],
        matchType: json["match_type"],
        playerType: json["player_type"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "player_name": playerName,
        "position": position,
        "points": points,
        "team": team,
        "match_type": matchType,
        "player_type": playerType,
        "status": status,
    };
}

class Team {
    String? teamName;
    int? position;
    int? points;
    int? rating;
    int? matches;
    int? matchType;
    int? status;

    Team({
        this.teamName,
        this.position,
        this.points,
        this.rating,
        this.matches,
        this.matchType,
        this.status,
    });

    factory Team.fromJson(Map<String, dynamic> json) => Team(
        teamName: json["team_name"],
        position: json["position"],
        points: json["points"],
        rating: json["rating"],
        matches: json["matches"],
        matchType: json["match_type"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "team_name": teamName,
        "position": position,
        "points": points,
        "rating": rating,
        "matches": matches,
        "match_type": matchType,
        "status": status,
    };
}
