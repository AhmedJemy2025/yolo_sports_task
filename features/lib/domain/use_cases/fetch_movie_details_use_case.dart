import 'package:core/networking/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:features/domain/entity/movie_details_entity.dart';

import '../repository/movies_repository.dart';

class FetchMovieDetailsUseCase {
  final MoviesRepository repository;

  FetchMovieDetailsUseCase(this.repository);

  Future<Either<Failure, MovieDetailsEntity>> execute({required int movieId}) {

    return repository.fetchMovieDetails(movieId: movieId);
  }
}
