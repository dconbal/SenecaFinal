import 'dart:convert';

class Logear {
  Logear({
    required this.result,
  });

  List<Result> result;

  factory Logear.fromJson(String str) => Logear.fromMap(json.decode(str));

  factory Logear.fromMap(Map<String, dynamic> json) => Logear(
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );
}

class Result {
  Result({
    required this.id,
    required this.username,
    required this.password,
  });

  String id;
  String username;
  String password;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        username: json["username"],
        password: json["password"],
      );
}
