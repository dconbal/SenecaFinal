import 'package:flutter/material.dart';

class CentroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Alumnado del centro"))),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Lista(
                icono: Icons.alarm,
                texto: "Conductas contrarias",
                redireccionar: 'conductas'),
            Lista(
                icono: Icons.search, texto: "Buscar Alumno", redireccionar: ''),
            Lista(
                icono: Icons.album, texto: "Alumnos centro", redireccionar: ''),
          ],

          //ListView(
          //children: [
          //  Elementos(
          //      redireccionar: 'conductas', texto: "Conductas contrarias"),
          //  Elementos(redireccionar: '', texto: "Notas"),
          //  Elementos(redireccionar: '', texto: "Buscar Alumno"),
          //  Elementos(redireccionar: '', texto: "Alumnos centro")
          //],
        ),
      ),
    );
  }
}

class Lista extends StatelessWidget {
  const Lista({
    Key? key,
    required this.texto,
    required this.redireccionar,
    required this.icono,
  }) : super(key: key);

  final String texto;
  final String redireccionar;
  final IconData icono;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(texto, style: TextStyle(fontSize: 20)),
      trailing: Icon(Icons.keyboard_arrow_right),
      leading: Icon(icono),
      onTap: () => {
        if (redireccionar != "") {Navigator.pushNamed(context, redireccionar)}
      },
    );
  }
}

class Elementos extends StatelessWidget {
  final String redireccionar;
  final String texto;

  const Elementos({
    Key? key,
    required this.redireccionar,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (redireccionar != "") {
          Navigator.pushNamed(context, redireccionar);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 15),
        height: 60,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Text(
          texto,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
