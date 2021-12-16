import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca/firebase/login_firebase.dart';
import 'package:seneca/providers/login_provider.dart';
import 'package:seneca/screens/alumnado_screen.dart';
import 'package:seneca/screens/alumnos_screen.dart';
import 'package:seneca/screens/centro_screen.dart';
import 'package:seneca/screens/conductas_contrarias_screen.dart';
import 'package:seneca/screens/datos_alumno.dart';
import 'package:seneca/screens/horario_screen.dart';
import 'package:seneca/screens/horarios_cursos_page.dart';
import 'package:seneca/screens/login_screen.dart';
import 'package:seneca/screens/principal_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:seneca/screens/mail_telefono_screen.dart';

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
      //initialRoute: 'login',
      initialRoute: 'alumnado',
      routes: {
        'login': (_) => LoginPage(),
        'principal': (_) => PrincipalScreen(),
        'screens': (_) => CentroScreen(),
        'conductas': (_) => ConductasContrariasScreen(),
        'alumnado': (_) => AlumnadoScreen(),
        'contact': (_) => MailPhoneScreen(),
        'alumnos': (_) => AlumnosScreen(),
        'datos_alumnos': (_) => DatosAlumnoScreen(),
        'horario': (_) => HorarioScreen(),
        'cursos_horario': (_) => HorariosCursosScreen(),
      },
    );
  }
}
