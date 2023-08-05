import 'package:billy/features/billy/economy_flow.dart';
import 'package:billy/features/billy/start_flow.dart';
import 'package:billy/features/home/home_repository.dart';
import 'package:billy/features/home/home_screen.dart';
import 'package:billy/features/login/login_screen.dart';
import 'package:billy/features/password/password_screen.dart';
import 'package:billy/features/register/register_screen.dart';
import 'package:billy/shared/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  _getIt.registerFactory<AuthRepository>((() => AuthRepository()));
  _getIt.registerFactory<HomeRepository>((() => HomeRepository()));
  _getIt.registerSingleton<SharedPreferences>(prefs);
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
        'login': (context) => LoginScreen(),
        'register': (context) => RegisterScreen(),
        'password_recovery': (context) => PasswordRecoveryScreen(),
        'home': (context) => HomeScreen(),
        'start_flow': (context) => StartFlowScreen(),
        'economy_flow': (context) => EconomyFlowScreen()
      },
    );
  }
}
