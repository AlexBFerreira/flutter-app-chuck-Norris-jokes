
import 'package:chuck_norris_jokes/modules/random/pages/random_joke_page.dart';
import 'package:chuck_norris_jokes/modules/splash/pages/spash_page.dart';
import 'package:flutter/material.dart';

const String homeRoute = "/home";
const String splashRoute = "/";

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );
      case homeRoute:
        return MaterialPageRoute(
          builder: (context) => const RandomJokePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("La ruta ${settings.name} no existe :C"),
            ),
          ),
        );
    }
  }
}
