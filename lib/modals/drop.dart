class Drop {
  String _title;
  String _photo;
  int _quantity;
  double _rating;
  double _quote;

  Drop();

  Drop.get(
      this._title, this._photo, this._quantity, this._rating, this._quote);

  double get quote => _quote;

  set quote(double value) {
    _quote = value;
  }

  double get rating => _rating;

  set rating(double value) {
    _rating = value;
  }

  int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value;
  }

  String get photo => _photo;

  set photo(String value) {
    _photo = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}