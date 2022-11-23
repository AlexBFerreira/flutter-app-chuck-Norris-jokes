import 'package:chuck_norris_jokes/config/routes/router.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chuck Norris Jokes',
      initialRoute: splashRoute,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}