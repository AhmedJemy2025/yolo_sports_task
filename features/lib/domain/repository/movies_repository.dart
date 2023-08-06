import 'package:core/networking/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:features/domain/entity/movie_details_entity.dart';
import 'package:features/domain/entity/movie_entity.dart';
abstract class MoviesRepository {

  Future<Either<Failure , List<MovieEntity>>> fetchLatestMovies();
  Future<Either<Failure , List<MovieEntity>>> fetchPopularMovies();
  Future<Either<Failure , List<MovieEntity>>> fetchTopRatedMovies();
  Future<Either<Failure , List<MovieEntity>>> fetchUpcomingMovies();
  Future<Either<Failure , MovieDetailsEntity>> fetchMovieDetails(
      {required int movieId});

}
