import 'package:chuck_norris_jokes/config/routes/router.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Future.delayed(const Duration(seconds: 3), () => Navigator.of(context).pushNamed(homeRoute));

    return Scaffold(
      body: Center(
        child: Image.asset("assets/logo_chuck.png", height: 200),
      ),
    );
  } 
}