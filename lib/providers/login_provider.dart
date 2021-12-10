import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seneca/models/login.dart';

class LoginProvider extends ChangeNotifier {
  List<Result> list = [];
  String _key = "1R8ypeKfUwas_L4_Akjenuf5LA6iF_8Wpr9DY2GleD0k";
  String _baseUrl = "opensheet.vercel.app";
  String _page = "1";

  LoginProvider() {
    print("Login Provider inicalizado");
    getAcounts();
  }

  Future<String> _getJsonData() async {
    var url = Uri.parse("https://" + _baseUrl + "/" + _key + "/" + _page);

    final response = await http.post(url);

    return response.body;
  }

  getAcounts() async {
    String jsonData = await this._getJsonData();
    jsonData = '{"result":' + jsonData + '}';
    final nowPlayingRespose = Logear.fromJson(jsonData);

    list = nowPlayingRespose.result;
  }
}
