import 'package:core/networking/failure.dart';

import '../entity/movie_entity.dart';
import '../repository/movies_repository.dart';
import 'package:dartz/dartz.dart';
class FetchUpcomingMoviesUseCase {

  final MoviesRepository repository;

  FetchUpcomingMoviesUseCase(this.repository);

  Future<Either<Failure , List<MovieEntity>>>execute() {
    return repository.fetchUpcomingMovies();
  }



}
