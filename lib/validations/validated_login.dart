class validatedLogin {
  String _data ="Validated";
  String EntryIsValidated(_email,_password) {

    if (_email.text.isEmpty ||
        _password.text.isEmpty) {
      _data = "EMAIL y Contraseña son obligatorios";
    }else{
        if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(_email.text)) {
          _data = "Entre un formato de EMAIL valido";

        }else{
            if (!RegExp(r"^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8}$")
                .hasMatch(_password.text)) {
              _data = "La contraseña debe tener 8 caracteres, al menos\nun numero, una letra minuscula y una mayuscula";
            }
        }
    }
    return _data;
  }

}
