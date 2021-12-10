import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca/firebase/login_firebase.dart';
import 'package:seneca/providers/login_provider.dart';
import 'package:seneca/screens/centro_screen.dart';
import 'package:seneca/screens/conductas_contrarias_screen.dart';
import 'package:seneca/screens/login_screen.dart';
import 'package:seneca/screens/principal_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider(), lazy: false),
        ChangeNotifierProvider(
            create: (_) => GoogleSignInProvider(), lazy: false)
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginPage(),
        'principal': (_) => PrincipalScreen(),
        'screens': (_) => CentroScreen(),
        'conductas': (_) => ConductasContrariasScreen()
      },
    );
  }
}
