import 'dart:convert';

import 'package:http/http.dart' as http;

class DatabaseHelper {
  String url = "https://api.escuelajs.co/api/v1/categories";
  //function getAPi
  Future getApi() async {
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }
}
