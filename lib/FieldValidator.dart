import 'package:email_validator/email_validator.dart';

class FieldValidator{

  static String? validateEmail(String email){
    if(email.isEmpty){
      return "Campo obrigatório";
    }
    return EmailValidator.validate(email) ? null : "Email inválido";
  }

  static String? validatePassword(String password){
    if(password.isEmpty){
      return "Campo obrigatório";
    }
    return password.length >= 8 ? null : "Senha inválida";
  }

}