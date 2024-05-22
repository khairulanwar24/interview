// screens/movie_list_screen.dart
import 'package:flutter/material.dart';
import 'package:interview/providers/Movie_Provider.dart';
import 'package:provider/provider.dart';

class MovieListScreen extends StatefulWidget {
  final String apiUrl;

  const MovieListScreen({super.key, required this.apiUrl});

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MovieProvider>(context, listen: false)
        .fetchMovies(widget.apiUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) {
          if (movieProvider.movies.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              itemCount: movieProvider.movies.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final movie = movieProvider.movies[index];
                return ListTile(
                  leading:
                      Image.network(movie.image, width: 50, fit: BoxFit.cover),
                  title: Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(movie.director),
                  onTap: () {
                    // Implementasi aksi ketika item di-tap
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
