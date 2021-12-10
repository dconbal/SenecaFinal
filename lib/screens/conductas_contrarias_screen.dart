import 'package:flutter/material.dart';

class ConductasContrariasScreen extends StatefulWidget {
  @override
  State<ConductasContrariasScreen> createState() =>
      _ConductasContrariasScreenState();
}

class _ConductasContrariasScreenState extends State<ConductasContrariasScreen> {
  bool leves = false;
  bool graves = false;

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      fontSize: 20,
    );
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Column(
              children: [
                Row(
                  children: [
                    //bola leves
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            leves = !leves;
                            if (leves == true) {
                              graves = false;
                            }
                          });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(500.0),
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.red,
                            height: 200,
                            width: 200,
                            child: Text(
                              "Leves",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //bola graves
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 50),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            graves = !graves;
                            if (graves == true) {
                              leves = false;
                            }
                          });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(500.0),
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.red,
                            height: 200,
                            width: 200,
                            child: Text(
                              "Graves",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //Texto leves
                Visibility(
                  visible: leves,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                            "1.- Actuaciones que no interrumpen el transcurso normal de la clase. Apercibimiento verbal al alumnado",
                            style: textStyle),
                        Text(
                            "\n2.- Comunicación vía iPasen a las familias. OBLIGATORIO.En la posibilidad de llama telefónica para aquellos alumnos con problemas",
                            style: textStyle),
                        Text(
                            "\n3.- A criterio del profesor hacer parte correspondiente para convivencia",
                            style: textStyle),
                      ],
                    ),
                  ),
                ),
                //Bola graves
                Visibility(
                  visible: graves,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                            "1.-Solamente cuando impida el desarrollo normal de la clase o es un acto lo suficientemente grave a criterio del profesor.",
                            style: textStyle),
                        Text(
                            "\n2.- El delegado de clase irá a por un profesor de guardia o directivo de guardia.",
                            style: textStyle),
                        Text(
                            "\n3.- Mientras el profesorado remitirá un mensaje al whatApp de Convivencia de la directiva diciendo lo que ha sucedido lo más detalladamente posible.",
                            style: textStyle),
                        Text(
                            "\n4.- El directivo o convivencia llamará a las familias para que vengan inmediatamente al centro",
                            style: textStyle),
                        Text(
                            "\n5.- El equipo directivo junto a convivencia determinará la gravedad y puede darse tres escenarios:",
                            style: textStyle),
                        Container(
                          margin: EdgeInsets.only(left: 50),
                          child: Column(
                            children: [
                              Text(
                                  "1. El alumno se va expulsado a casa con su familia.",
                                  style: textStyle),
                              Text(
                                  "2. El alumno se queda en el aula de mayores hasta finalizar la jornada porque no viene ningún familiar.",
                                  style: textStyle),
                              Text(
                                  "3. El alumno se incorpora a la siguiente hora a su grupo.",
                                  style: textStyle),
                            ],
                          ),
                        ),
                        Text(
                            "\n6.- El profesorado debe rellenar de forma obligatoria el parte correspondiente e informar a todo el equipo educativo de dicho curso a través de observaciones compartidas lo sucedido. En caso de no impartir clase al alumno el profesorado deberá rellenar el parte e informar al tutor de la clase del alumno lo sucedido",
                            style: textStyle),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
