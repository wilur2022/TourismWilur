class UserApp{
  //Attributes
  var _uid;
  var _name;
  var _phone;
  var _email;
  var _password;

  //Constructor
  UserApp(this._uid, this._name, this._phone, this._email, this._password);

  //Constructor Empty
  UserApp.Empty();

  //Convert UserApp to Json
  UserApp.fromJson(Map<String, dynamic> json)
      :
        _uid = json['name'],
        _name = json['name'],
        _phone = json['phone'],
        _email = json['email'],
        _password = json['password'];

  Map<String, dynamic> toJson() => {
    'uid' : _uid,
    'name' : _name,
    'phone' : _phone,
    'email' : _email,
    'password' : _password
  };

  //Getters and Setters
  get uid => _uid;

  set uid(value) {
    _uid = value;
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