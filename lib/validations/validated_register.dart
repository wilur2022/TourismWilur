class validateEntry {
  String _data ="Validated";
  String EntryIsValidated(_name,_phone,_email,_password,_repeatpassword) {

    if (_name.text.isEmpty ||
        _phone.text.isEmpty ||
        _email.text.isEmpty ||
        _password.text.isEmpty ||
        _repeatpassword.text.isEmpty) {
      _data = "Todos los campos son obligatorios";
    }else{
      if (!RegExp(r"^\s*([A-Za-z]{1,20}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
          .hasMatch(_name.text)) {
        _data = "Ingrese su nombre completo";
      }else{
        if (!RegExp(r"^\+?[0-9]{10}$").hasMatch(_phone.text)) {
          _data = "Telefono no valido. Digite los diez(10) digitos";
        }else{
          if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(_email.text)) {
            _data = "Entre un formato de EMAIL valido";
          }else{
            if (!RegExp(r"^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8}$")
                .hasMatch(_password.text)) {
              _data = "La contraseña debe tener 8 caracteres, al menos\nun numero, una letra minuscula y una mayuscula";
            }else{
              if (_password.text != _repeatpassword.text) {
                _data = "Las contraseñas digitadas deben ser iguales";
              }
            }

          }
        }

      }
    }

    return _data;
  }

}
