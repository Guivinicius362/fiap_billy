import 'package:billy/features/login/login_screen.dart';
import 'package:billy/features/register/register_screen.dart';
import 'package:billy/shared/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final _getIt = GetIt.instance;
void main() {
  _getIt.registerFactory<AuthRepository>((() => AuthRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xCB03B7)),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      routes: {
        'login': (context) => RegisterScreen(),
        'register': (context) => RegisterScreen(),
      },
    );
  }
}
