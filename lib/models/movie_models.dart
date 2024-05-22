// models/movie.dart
class Movie {
  final int id;
  final String title;
  final String director;
  final String summary;
  final String createdAt;
  final String updatedAt;
  final String image;
  final List<Genre> genres;

  Movie({
    required this.id,
    required this.title,
    required this.director,
    required this.summary,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
    required this.genres,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      director: json['director'],
      summary: json['summary'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      image: json['image'],
      genres: (json['genres'] as List).map((i) => Genre.fromJson(i)).toList(),
    );
  }
}

class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}
