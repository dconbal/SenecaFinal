import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seneca/models/alumnos.dart';
import 'package:seneca/models/cursos.dart';
import 'package:seneca/models/horario.dart';
import 'package:seneca/models/login.dart';

class LoginProvider extends ChangeNotifier {
  List<DatosAlumnos> alumno = [];
  List<HorarioResult> horario = [];

  List<Result> list = [];
  String _key = "1R8ypeKfUwas_L4_Akjenuf5LA6iF_8Wpr9DY2GleD0k";
  String _baseUrl = "opensheet.vercel.app";
  String _page = "1";

  //hoja excel
  //https://docs.google.com/spreadsheets/d/1TUUhwPtc06E_Ka-TU_4XUiGOz-BZOEjdLvbxRAJQiMg/edit#gid=0

  //https://opensheet.vercel.app/1TUUhwPtc06E_Ka-TU_4XUiGOz-BZOEjdLvbxRAJQiMg/Cursos
  final _url = "opensheet.vercel.app";
  final _api = "1TUUhwPtc06E_Ka-TU_4XUiGOz-BZOEjdLvbxRAJQiMg";
  final _hojaCursos = "Cursos";

  //https://opensheet.vercel.app/1TUUhwPtc06E_Ka-TU_4XUiGOz-BZOEjdLvbxRAJQiMg/Datos_Alumnado
  final _hojaAlumnos = "Datos_Alumnado";

  //https://opensheet.vercel.app/1TUUhwPtc06E_Ka-TU_4XUiGOz-BZOEjdLvbxRAJQiMg/horarios
  final _hojaHorario = "Horarios";

  LoginProvider() {
    print("Login Provider inicalizado");
    //getAcounts();
    getAlumno();
    getHorario();
  }

  Future<String> _getJsonData(String baseurl, String api, String pagina) async {
    var url = Uri.parse("https://" + baseurl + "/" + api + "/" + pagina);

    final response = await http.post(url);

    return response.body;
  }

  getAcounts() async {
    String jsonData = await this._getJsonData(_baseUrl, _key, _page);
    jsonData = '{"result":' + jsonData + '}';
    final nowPlayingRespose = Logear.fromJson(jsonData);

    list = nowPlayingRespose.result;
  }

  Future<List<String>> getCursos() async {
    String jsonData = await this._getJsonData(_url, _api, _hojaCursos);
    jsonData = '{"result":' + jsonData + '}';
    final nowPlayingRespose = Cursos.fromJson(jsonData);
    List<String> nombres = [];

    for (int i = 0; i < nowPlayingRespose.result.length; i++) {
      nombres.add(nowPlayingRespose.result[i].cursoNombre);
    }
    return nombres;
  }

  Future<List<dynamic>> getAlumnos(String cursoABuscarAlumnos) async {
    String jsonData = await this._getJsonData(_url, _api, _hojaAlumnos);
    jsonData = '{"result":' + jsonData + '}';
    final nowPlayingRespose = Alumnos.fromJson(jsonData);
    List<dynamic> nombresAlumnos = [];
    for (int i = 0; i < nowPlayingRespose.result.length; i++) {
      if (nowPlayingRespose.result[i].curso == cursoABuscarAlumnos)
        nombresAlumnos.add(nowPlayingRespose.result[i].nombre);
    }
    return nombresAlumnos;
  }

  getAlumno() async {
    String jsonData = await this._getJsonData(_url, _api, _hojaAlumnos);
    jsonData = '{"result":' + jsonData + '}';
    final nowPlayingRespose = Alumnos.fromJson(jsonData);
    alumno = nowPlayingRespose.result;
  }

  getHorario() async {
    String jsonData = await this._getJsonData(_url, _api, _hojaHorario);
    jsonData = '{"result":' + jsonData + '}';
    final nowPlayingRespose = Horario.fromJson(jsonData);
    horario = nowPlayingRespose.result;
  }
}

final datos = new LoginProvider();
