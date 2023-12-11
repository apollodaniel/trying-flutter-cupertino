import 'package:aprendendo_cupertino/FieldValidator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'HomeController.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  bool loading = false;

  @observable
  TextEditingController emailController = TextEditingController();
  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  String? emailError;
  @observable
  String? passwordError;

  login(BuildContext context) async {
    loading = true;

    // senha 12345678

    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        passwordError != null ||
        emailError != null) {
      // field error
      showCupertinoModalPopup<void>(
        context: context,
        builder: (context)=>
        CupertinoAlertDialog(
          title: Text("Atenção!"),
          content: Text("Ocorreu um erro, verifique se os campos estão corretos e tente novamente", softWrap: true),
          actions: [
            CupertinoDialogAction(
              child: Text("Ok"),
              onPressed: ()=>Navigator.pop(context),
            )
          ],
        )
      );

    }else if(passwordController.text != "12345678"){
      // account validation error

      showCupertinoModalPopup<void>(
        context: context,
        builder: (context)=>
        CupertinoAlertDialog(
          title: Text("Atenção!"),
          content: Text("Email ou senha incorretos, verifique e tente novamente", softWrap: true),
          actions: [
            CupertinoDialogAction(
              child: Text("Ok"),
              onPressed: ()=>Navigator.pop(context),
            )
          ],
        )
      );
    }
    else{
      // verificação completa
      Navigator.pushNamed(context, "/userProfile");
    }
    loading = false;
  }

  @action
  onChangedEmail()=> emailError = FieldValidator.validateEmail(emailController.text);
    
  @action
  onChangedPassword()=> passwordError = FieldValidator.validatePassword(passwordController.text);

}
