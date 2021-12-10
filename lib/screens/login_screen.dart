import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:seneca/firebase/login_firebase.dart';
import 'package:seneca/providers/login_provider.dart';

class LoginPage extends StatelessWidget {
  bool _mostrarPass = true;

  @override
  Widget build(BuildContext context) {
    GoogleSignInProvider service = new GoogleSignInProvider();
    final usuarios = Provider.of<LoginProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.8],
            colors: [
              Color(0xff01549c),
              Color(0xff01315a),
            ],
          ),
        ),
        //Si quitas el ListView al abrir el teclado sale sale un error justo encima del teclado
        child: Center(
          child: SafeArea(
            child: Container(
              alignment: Alignment.center,
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 5),
                  //titulo
                  Text(
                    "iSéneca",
                    style: TextStyle(
                      fontSize: 80,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  //cuadro de texto del usuario
                  CuadroUsuario(),
                  SizedBox(height: 20),
                  //Cuadro de la contraseña
                  CuadroContrasena(),
                  SizedBox(height: 20),
                  //boton para acceder
                  Boton(),

                  SizedBox(height: 20),

                  //boton de google
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Color(0xff27578b),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
                    label: Text('Sign up with Google'),
                    onPressed: () async {
                      bool entrar = false;
                      try {
                        await service.signOutFromGoogle();
                        await service.signInwithGoogle();

                        if (FirebaseAuth.instance.currentUser != null) {
                          final correoUser =
                              FirebaseAuth.instance.currentUser!.email;
                          for (int i = 0; i <= usuarios.list.length - 1; i++) {
                            if (correoUser == usuarios.list[i].username) {
                              entrar = true;
                              Navigator.pushNamed(context, 'principal');
                            }
                          }
                        }
                        //sino entra
                        if (!entrar) {
                          showDialog(
                              context: context,
                              //Se tenga que pulsar el boton para salir de la ventana
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                //Ventana emergente
                                return AlertDialog(
                                  title: Text("Error"),
                                  content: Text(
                                      "El correo no tiene permisos para acceder"),
                                  actions: [
                                    TextButton(
                                      child: Text("Ok"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                        }
                      } catch (e) {
                        if (e is FirebaseAuthException) {
                          print(e.message!);
                        }
                      }
                    },
                  ),

                  SizedBox(height: 50),
                  //He olvidado mi contraseña
                  RecuperarContrasena(),

                  SizedBox(height: 110),

                  LogoJuntaAndalucia(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "v11.3.0",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CuadroUsuario extends StatefulWidget {
  @override
  State<CuadroUsuario> createState() => _CuadroUsuarioState();
}

class _CuadroUsuarioState extends State<CuadroUsuario> {
  static String username = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white12,
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
      ),
      child: TextField(
        style: TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.white, width: 0.0),
            ),
            hintText: "Usuario",
            hintStyle: TextStyle(color: Colors.white, fontSize: 20)),
        onChanged: (valor) {
          setState(() {
            username = valor;
          });
        },
      ),
    );
  }
}

class CuadroContrasena extends StatefulWidget {
  @override
  State<CuadroContrasena> createState() => _CuadroContrasenaState();
}

class _CuadroContrasenaState extends State<CuadroContrasena> {
  bool _mostrarPass = false;
  static String contrasena = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white12,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: TextField(
        obscureText: !_mostrarPass,
        style: TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.white, width: 0.0),
          ),
          hintText: "Contraseña",
          hintStyle: TextStyle(color: Colors.white, fontSize: 20),
          suffixIcon: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              ),
              GestureDetector(
                child: FittedBox(
                  child: Icon(
                    Icons.remove_red_eye,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                onTap: () => setState(
                  () {
                    _mostrarPass = !_mostrarPass;
                  },
                ),
              ),
            ],
          ),
        ),
        onChanged: (valor) {
          setState(() {
            contrasena = valor;
          });
        },
      ),
    );
  }
}

class Boton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarios = Provider.of<LoginProvider>(context);
    return Container(
      height: 60,
      width: 350,
      color: Colors.white,
      child: TextButton(
        onPressed: () {
          for (int i = 0; i <= usuarios.list.length - 1; i++) {
            if (_CuadroUsuarioState.username == usuarios.list[i].username) {
              if (_CuadroContrasenaState.contrasena ==
                  usuarios.list[i].password) {
                Navigator.pushNamed(context, 'principal');
              }
            }
          }
        },
        child: Text(
          "Entrar",
          style: TextStyle(fontSize: 20, color: Color(0xff27578b)),
        ),
      ),
    );
  }
}

class RecuperarContrasena extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        "No recuerdo mi contraseña",
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: Colors.white,
          fontSize: 22,
        ),
      ),
      onTap: () {},
    );
  }
}

class LogoJuntaAndalucia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //imagen junta de andalucia
        Image(
          image: AssetImage('assets/logo.png'),
          width: 100,
        ),
        //Texto de la junta de andalucia
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Junta de Andalucía",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              "Consejería de Educación y Deporte",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        )
      ],
    );
  }
}
