import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features/domain/entity/movie_entity.dart';
import 'package:features/domain/use_cases/fetch_top_rated_movies_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/init_mocks.mocks.dart';

void main() {
  late MockMoviesRepositoryImpl repository;
  late FetchTopRatedMoviesUseCase useCase;

  setUp(() {
    repository = MockMoviesRepositoryImpl();
    useCase = FetchTopRatedMoviesUseCase(repository);
  });

  List<MovieEntity> movies = [
    const MovieEntity(1, "title", "https://image.tmdb.org/t/p/w342posterPath"),
    const MovieEntity(
        2, "title2", "https://image.tmdb.org/t/p/w342posterPath2"),
  ];

  test('should get list of movies from the repository', () async {
    // arrange
    when(repository.fetchTopRatedMovies())
        .thenAnswer((_) async => right(movies));
    // act
    final result = await useCase.execute();
    // assert
    expect(result, Right(movies));
    verify(repository.fetchTopRatedMovies());
    verifyNoMoreInteractions(repository);
  });

  test('should get Error from the repository', () async {
    // arrange
    when(repository.fetchTopRatedMovies())
        .thenAnswer((_) async => left(const Failure("Server Error")));
    // act
    final result = await useCase.execute();
    // assert
    expect(result, const Left(Failure("Server Error")));
    verify(repository.fetchTopRatedMovies());
    verifyNoMoreInteractions(repository);
  });
}
