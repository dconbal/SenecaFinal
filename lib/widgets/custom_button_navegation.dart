import 'package:flutter/material.dart';

class CustomButtonNavegation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //tamaños iconos
      iconSize: 30,

      //tamaños titulos
      selectedFontSize: 15,
      unselectedFontSize: 15,

      //se vean los titulos
      showUnselectedLabels: true,

      //Color titulos
      fixedColor: Color(0xff3e5f8a),
      unselectedItemColor: Color(0xff9b9b9b),

      //item seleccionado
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Inicio",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.watch_later_outlined),
          label: "Agenda",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: "Comunicaciones",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: "Menú",
        ),
      ],
    );
  }
}
