// main.dart
import 'package:flutter/material.dart';
import 'package:interview/providers/Movie_Provider.dart';
import 'package:interview/screens/movie_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieProvider()),
      ],
      child: MaterialApp(
        title: 'Movie List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MovieListScreen(
            apiUrl: 'https://technical.test.talenavi.com/api/movie?page=1'),
      ),
    );
  }
}
