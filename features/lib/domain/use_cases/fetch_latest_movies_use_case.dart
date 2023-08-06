import 'package:core/core.dart';
import 'package:features/domain/entity/movie_entity.dart';
import 'package:features/domain/repository/movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';
class FetchLatestMoviesUseCase {
  final MoviesRepository repository;

  FetchLatestMoviesUseCase(this.repository);


  Stream<Either<Failure , List<MovieEntity>>> execute() {
    // Immediately fetch the movies.
    final immediateStream = Stream.fromFuture(repository.fetchLatestMovies());

    // Create a stream that fetches movies every 30 seconds.
    final periodicStream = Stream.periodic(const Duration(seconds: 30))
        .asyncMap((_) => repository.fetchLatestMovies());

    // Merge the two streams.
    return Rx.concat([immediateStream , periodicStream]);

  }


}
