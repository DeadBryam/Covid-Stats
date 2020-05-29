class Cases {
  String _country;
  int _recovered;
  int _deaths;
  int _active;
  int _critical;
  String _newDeaths;
  String _newActive;
  int _total;
  int _tests;
  String _day;

  String get country => this._country;
  String get day => this._day;
  int get recovered => this._recovered;
  int get deaths => this._deaths;
  int get active => this._active;
  int get critical => this._critical;
  String get newDeaths => this._newDeaths;
  String get newActive => this._newActive;
  int get total => this._total;
  int get test => this._tests;

  Cases.fromJson(Map<String, dynamic> json) {
    this._country = json['country'];
    this._recovered = json['cases']['recovered'];
    this._deaths = json['deaths']['total'];
    this._active = json['cases']['active'];
    this._critical = json['cases']['critical'];
    this._newDeaths = json['deaths']['new'];
    this._newActive = json['cases']['new'];
    this._total = json['cases']['total'];
    this._tests = json['tests']['total'];
    this._day = json['day'];
  }
}
