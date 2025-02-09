import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meu_guia/models/motel/motel_model.dart';

class MotelRepository {
  final String apiUrl = 'https://www.jsonkeeper.com/b/1IXK';

  Future<List<Motel>> fetchMoteis() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final String responseBody = utf8.decode(response.bodyBytes);
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);

      List<dynamic> moteisJson = jsonResponse['data']['moteis'];
      return moteisJson.map((json) => Motel.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar moteis');
    }
  }
}
