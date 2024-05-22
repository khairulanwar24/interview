// services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:interview/models/movie_models.dart';

class ApiService {
  static Future<List<Movie>> fetchMovies(String apiUrl) async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data']['data'] as List;
      return data.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
