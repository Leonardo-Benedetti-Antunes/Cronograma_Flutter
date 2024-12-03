import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cronograma_frontend/data/models/professor_model.dart';

class ProfessorViewmodel {
  static Future<List<ProfessorModel>> fetchProfessor() async {
    try {
      final response = await http.get(Uri.parse("http://localhost:8080/professor"));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((e) => ProfessorModel.fromJson(e)).toList();
      } else {
        throw Exception("Erro ao buscar dados: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Erro ao conectar-se à API: $e");
    }
  }
}
