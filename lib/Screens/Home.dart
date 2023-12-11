import 'package:aprendendo_cupertino/Controller/HomeController.dart';
import 'package:aprendendo_cupertino/Widgets/CustomCupertinoButton.dart';
import 'package:aprendendo_cupertino/Widgets/CustomCupertinoTextField.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "Welcome back,\n",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      )),
                  TextSpan(
                      text: "Apollo",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 48,
                      )),
                ])),
              ),
              const SizedBox(
                height: 32,
              ),
              CustomCupertinoTextField(
                name: "Email",
                controller: homeController.emailController,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomCupertinoTextField(
                name: "Password",
                controller: homeController.passwordController,
              ),
              const SizedBox(
                height: 32,
              ),
              CustomCupertinoButton(
                buttonText: "Login",
                loading: false,
                onPressed: () => homeController.login(context)
              ),
            ],
          ),
        ),
      );
  }
}