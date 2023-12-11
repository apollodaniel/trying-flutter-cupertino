import 'package:aprendendo_cupertino/Screens/Home.dart';
import 'package:aprendendo_cupertino/Screens/UserProfile.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  
  bool passwordFieldFocus = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
      ),
      home: Home(),
      routes: {
        "/home": (context) => const Home(),
        "/userProfile": (context) => const UserProfile(),
      },
    );
  }
}




