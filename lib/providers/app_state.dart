import 'package:flutter/material.dart';
import 'package:sidelineref/models/team_model.dart';

enum TeamType { home, away }

class AppState extends ChangeNotifier {
  TeamModel home = TeamModel(name: "Home");
  TeamModel away = TeamModel(name: "Away");

  String getName(TeamType type) {
    if (type == TeamType.home) {
      return home.name;
    }

    return away.name;
  }

  int getPoints(TeamType type) {
    if (type == TeamType.home) {
      return home.points;
    }

    return away.points;
  }

  addPoint(TeamType type) {
    if (type == TeamType.home) {
      home.addPoint();
    } else {
      away.addPoint();
    }

    notifyListeners();
  }

  minusPoint(TeamType type) {
    TeamModel team;
    if (type == TeamType.home) {
      team = home;
    } else {
      team = away;
    }

    if (team.points > 0) {
      team.minusPoint();
    }
    notifyListeners();
  }

  resetPoints() {
    home.resetPoints();
    away.resetPoints();
    notifyListeners();
  }
}
