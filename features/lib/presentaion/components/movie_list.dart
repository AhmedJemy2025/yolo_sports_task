import 'package:features/presentaion/components/movie_item.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/movie_entity.dart';

class MovieList extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          itemCount: movies.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return MovieItem(movie: movies[index]);
          }),
    );
  }
}
