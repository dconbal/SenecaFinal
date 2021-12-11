import 'package:flutter/material.dart';
import 'package:seneca/providers/login_provider.dart';

class AlumnosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final curso = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Listado de Alumnos"))),
      body: _alumnos(curso),
    );
  }

  Widget _alumnos(curso) {
    return FutureBuilder(
      future: datos.getAlumnos(curso),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    for (int i = 0; i < data.length; i++) {
      print(data[i]);
      final widgetTemp = ListTile(
        title: Text(data[i].toString()),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          //Navigator.pushNamed(context, ''); //opt['ruta']
        },
      );
      opciones
        ..add(widgetTemp)
        ..add(Divider());
    }
    ;
    return opciones;
  }
}
