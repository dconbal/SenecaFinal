import 'package:flutter/material.dart';
import 'package:seneca/providers/login_provider.dart';

class HorarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Listado de cursos"))),
      body: _cursos(),
    );
  }

  Widget _cursos() {
    return FutureBuilder(
      future: datos.getCursos(),
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
      final widgetTemp = ListTile(
        title: Text(data[i]),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pushNamed(
            context,
            'cursos_horario',
            arguments: data[i],
          );
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
