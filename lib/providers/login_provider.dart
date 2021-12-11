import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seneca/models/cursos.dart';
import 'package:seneca/models/login.dart';

class LoginProvider extends ChangeNotifier {
  List<Result> list = [];
  String _key = "1R8ypeKfUwas_L4_Akjenuf5LA6iF_8Wpr9DY2GleD0k";
  String _baseUrl = "opensheet.vercel.app";
  String _page = "1";

  //https://opensheet.vercel.app/1TUUhwPtc06E_Ka-TU_4XUiGOz-BZOEjdLvbxRAJQiMg/Cursos
  final _url = "opensheet.vercel.app";
  final _api = "1TUUhwPtc06E_Ka-TU_4XUiGOz-BZOEjdLvbxRAJQiMg";
  final _hoja = "Cursos";

  LoginProvider() {
    print("Login Provider inicalizado");
    getAcounts();
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
    String jsonData = await this._getJsonData(_url, _api, _hoja);
    jsonData = '{"result":' + jsonData + '}';
    final nowPlayingRespose = Cursos.fromJson(jsonData);
    List<String> nombres = [];

    for (int i = 0; i < nowPlayingRespose.result.length; i++) {
      nombres.add(nowPlayingRespose.result[i].cursoNombre);
    }
    return nombres;
  }
}

final datos = new LoginProvider();
