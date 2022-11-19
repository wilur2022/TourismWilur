class UserApp{
  //Attributes
  var _uid;
  var _name;
  var _phone;
  var _email;
  var _password;
  var _nationality;
  var  _tourismFavorites = [];
  var _dateVacations;

  //Constructor
  UserApp(this._uid, this._name, this._phone, this._email, this._password, this._nationality,
      this._tourismFavorites, this._dateVacations);

  //Constructor Empty
  UserApp.Empty();

  //Convert UserApp to Json
  UserApp.fromJson(Map<String, dynamic> json)
      :
        _uid = json['name'],
        _name = json['name'],
        _phone = json['phone'],
        _email = json['email'],
        _password = json['password'],
        _nationality = json['nationality'],
        _tourismFavorites = json['tourismFavorites'],
        _dateVacations = json['dateVacations'];

  Map<String, dynamic> toJson() => {
    'uid' : _uid,
    'name' : _name,
    'phone' : _phone,
    'email' : _email,
    'password' : _password,
    'nationality' : _nationality,
    'tourismFavorites' : _tourismFavorites,
    'dateVacations' : _dateVacations
  };

  //Getters and Setters
  get uid => _uid;

  set uid(value) {
    _uid = value;
  }

  get dateVacations => _dateVacations;

  set dateVacations(value) {
    _dateVacations = value;
  }

  get tourismFavorites => _tourismFavorites;

  set tourismFavorites(value) {
    _tourismFavorites = value;
  }

  get nationality => _nationality;

  set nationality(value) {
    _nationality = value;
  }


  get password => _password;

  set password(value) {
    _password = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  get phone => _phone;

  set phone(value) {
    _phone = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

}