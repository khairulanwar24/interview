// providers/movie_provider.dart
import 'package:flutter/material.dart';
import 'package:interview/models/movie_models.dart';
import 'package:interview/services/api_services.dart';

class MovieProvider with ChangeNotifier {
  List<Movie> _movies = [];
  Movie? _selectedMovie;

  List<Movie> get movies => _movies;
  Movie? get selectedMovie => _selectedMovie;

  Future<void> fetchMovies(String apiUrl) async {
    _movies = await ApiService.fetchMovies(apiUrl);
    notifyListeners();
  }

  void selectMovie(Movie movie) {
    _selectedMovie = movie;
    notifyListeners();
  }
}
