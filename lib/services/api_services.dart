import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  static final ApiServices _singleton = ApiServices._internal();

  ApiServices._internal();
  
  factory ApiServices() => _singleton;

  Future<dynamic> getData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }else {
        throw ('Erreur de chargement : code : ${response.statusCode}. Raison : ${response.reasonPhrase}');
      }
    } catch (e, stackTrace) {
      print('$e, $stackTrace');
    }
  }
}