class TeamModel {
  TeamModel({
    required this.name,
  });

  String name;
  int _points = 0;

  get points => _points;

  addPoint() {
    _points += 1;
  }

  minusPoint() {
    if (_points > 0) {
      _points -= 1;
    }
  }
}
