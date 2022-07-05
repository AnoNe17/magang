import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseURL = "http://192.168.18.147/api/";
const Map<String, String> header = {"Content-Type": "application/json"};

class Http {
  static Future<http.Response> login(String user, String pass) async {
    Map data = {
      "name": user,
      "password": pass,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'login');
    http.Response response = await http.post(
      url,
      headers: header,
      body: body,
    );

    try {
      // var dataLogin = json.decode(response.body)["user"];

      // // print(dataLogin);

      // SharedPreferences pref = await SharedPreferences.getInstance();
      // pref.setString('id_user', dataLogin["id"].toString());
      // // pref.setString('id_siswa', dataLogin["id_user"].toString());

      return response;
    } catch (e) {
      return response;
    }
  }
}
