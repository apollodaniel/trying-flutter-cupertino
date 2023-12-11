import 'package:flutter/cupertino.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Perfil do usuário"),
      ),
      child: Center(
        child: Text("Parabéns, você fez login!"),
      )
    );
  }
}