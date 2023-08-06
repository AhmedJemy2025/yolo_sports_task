import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features/data/models/movie_details/movie_details_response.dart';

import '../models/movies_response.dart';
abstract class RemoteMoviesDataSource {

  Future<Either<Failure ,MoviesResponse>>fetchLatestMovies();
  Future<Either<Failure ,MoviesResponse>>fetchPopularMovies();
  Future<Either<Failure ,MoviesResponse>>fetchTopRatedMovies();
  Future<Either<Failure ,MoviesResponse>>fetchUpcomingMovies();
  Future<Either<Failure ,MovieDetailsResponse>>fetchMovieDetails({required int movieId});

}
