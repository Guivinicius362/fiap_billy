import 'package:billy/features/billy/economy_flow.dart';
import 'package:billy/features/billy/start_flow.dart';
import 'package:billy/features/home/home_screen.dart';
import 'package:billy/features/home/main_screen.dart';
import 'package:billy/features/login/login_screen.dart';
import 'package:billy/features/password/password_screen.dart';
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 203, 3, 183),
        ),
        useMaterial3: true,
      ),
      home: LoginScreen(),
      routes: {
        'register': (context) => RegisterScreen(),
        'password_recovery': (context) => PasswordRecoveryScreen(),
        'home': (context) => MainScreen(),
        'start_flow': (context) => StartFlowScreen(),
        'economy_flow': (context) => EconomyFlowScreen()
      },
    );
  }
}
