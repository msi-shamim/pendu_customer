class Driver{
  String _name;
  String _contact;
  String _photo;
  double _successRate;
  int _accuracyScore;


  Driver();

  Driver.get(this._name, this._contact, this._photo, this._successRate,
      this._accuracyScore);

  int get accuracyScore => _accuracyScore;

  set accuracyScore(int value) {
    _accuracyScore = value;
  }

  double get successRate => _successRate;

  set successRate(double value) {
    _successRate = value;
  }

  String get photo => _photo;

  set photo(String value) {
    _photo = value;
  }

  String get contact => _contact;

  set contact(String value) {
    _contact = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}