import 'package:core/core.dart';
import 'package:features/data/models/movie_details/genre_model.dart';
import 'package:features/data/models/movie_details/genre_model.dart';
import 'package:features/data/models/movie_details/genre_model.dart';
import 'package:features/data/models/movie_details/movie_details_response.dart';
import 'package:features/data/models/movie_model.dart';
import 'package:features/data/models/movies_response.dart';
import 'package:features/data/repository/movies_repository_impl.dart';
import 'package:features/domain/entity/movie_details_entity.dart';
import 'package:features/domain/entity/movie_entity.dart';
import 'package:features/domain/mapper/movie_details_mapper.dart';
import 'package:features/domain/mapper/movies_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart' hide Bind;
import '../../helpers/init_mocks.mocks.dart';

void main() {
  late MockRemoteMoviesDataSourceImpl dataSource;
  late MoviesRepositoryImpl repository;

  setUp(() {
    dataSource = MockRemoteMoviesDataSourceImpl();
    repository =
        MoviesRepositoryImpl(dataSource, MoviesMapper(), MovieDetailsMapper());
  });


  MoviesResponse response = MoviesResponse(
      page: 1,
      totalPages: 4,
      totalResults: 4,
      results: <MovieModel>[
        MovieModel(
          id: 1,
          title: 'title',
          overview: 'overview',
          posterPath: 'posterPath',
          backdropPath: 'backdropPath',
          voteAverage: 1,
          releaseDate: 'releaseDate',
          genreIds: <int>[1, 2, 3],
        ),
        MovieModel(
          id: 2,
          title: 'title2',
          overview: 'overview2',
          posterPath: 'posterPath2',
          backdropPath: 'backdropPath2',
          voteAverage: 1,
          releaseDate: 'releaseDate2',
          genreIds: <int>[1, 2, 3],
        ),
      ]
  );


  List<MovieEntity> movies = [
    const MovieEntity(1, "title", "https://image.tmdb.org/t/p/w342posterPath"),
    const MovieEntity(
        2, "title2", "https://image.tmdb.org/t/p/w342posterPath2"),
  ];


  MovieDetailsResponse movieDetailsResponse = MovieDetailsResponse(
    id: 1,
    title: 'title',
    overview: 'overview',
    posterPath: 'posterPath',
    backdropPath: 'backdropPath',
    voteAverage: 1,
    releaseDate: '2020-10-01',
    runtime: 1,
    genres: <GenreModel>[
      GenreModel(id: 1, name: 'name'),
      GenreModel(id: 2, name: 'name2'),
    ],
  );

  MovieDetailsEntity movieDetailsEntity = const MovieDetailsEntity(
      1,
      "title",
      "https://image.tmdb.org/t/p/w342posterPath",
      1,
      "overview",
      "name, name2",
      "2020",
      false);


  test(
      'Should  return right response in success case in fetch latest', () async {
    when(dataSource.fetchLatestMovies())
        .thenAnswer((_) async => Future.value(right(response)));

    final result = await repository.fetchLatestMovies();

    result.fold((left) => fail("test failed"), (right) {
      expect(right, movies);
    });
  });

  test(
      'Should  return left Failure Message response in failed in latest movies', () async {
    when(dataSource.fetchLatestMovies())
        .thenAnswer((_) async =>
        Future.value(const Left(Failure("Server Error"))));

    final result = await repository.fetchLatestMovies();

    result.fold((left) {
      expect(left, const Failure("Server Error"));
    }, (right) => fail('test failed'));
  });

  /// popular movies
  test(
      'Should  return right response in success case in fetch popular', () async {
    when(dataSource.fetchPopularMovies())
        .thenAnswer((_) async => Future.value(right(response)));

    final result = await repository.fetchPopularMovies();

    result.fold((left) => fail("test failed"), (right) {
      expect(right, movies);
    });
  });

  test(
      'Should  return left Failure Message response in failed in popular movies', () async {
    when(dataSource.fetchPopularMovies())
        .thenAnswer((_) async =>
        Future.value(const Left(Failure("Server Error"))));

    final result = await repository.fetchPopularMovies();

    result.fold((left) {
      expect(left, const Failure("Server Error"));
    }, (right) => fail('test failed'));
  });

  /// upcoming movies
  test(
      'Should  return right response in success case in fetch upcoming', () async {
    when(dataSource.fetchUpcomingMovies())
        .thenAnswer((_) async => Future.value(right(response)));

    final result = await repository.fetchUpcomingMovies();

    result.fold((left) => fail("test failed"), (right) {
      expect(right, movies);
    });
  });

  test(
      'Should  return left Failure Message response in failed in upcoming movies', () async {
    when(dataSource.fetchUpcomingMovies())
        .thenAnswer((_) async =>
        Future.value(const Left(Failure("Server Error"))));

    final result = await repository.fetchUpcomingMovies();

    result.fold((left) {
      expect(left, const Failure("Server Error"));
    }, (right) => fail('test failed'));
  });

  /// top rated movies
  test(
      'Should  return right response in success case in fetch top rated', () async {
    when(dataSource.fetchTopRatedMovies())
        .thenAnswer((_) async => Future.value(right(response)));

    final result = await repository.fetchTopRatedMovies();

    result.fold((left) => fail("test failed"), (right) {
      expect(right, movies);
    });
  });

  test(
      'Should  return left Failure Message response in failed in top rated movies', () async {
    when(dataSource.fetchTopRatedMovies())
        .thenAnswer((_) async =>
        Future.value(const Left(Failure("Server Error"))));

    final result = await repository.fetchTopRatedMovies();

    result.fold((left) {
      expect(left, const Failure("Server Error"));
    }, (right) => fail('test failed'));
  });
  /// movieDetails
  test(
      'Should  return right response in success case in fetch movie details', () async {
    when(dataSource.fetchMovieDetails(movieId: 1))
        .thenAnswer((_) async => Future.value(right(movieDetailsResponse)));

    final result = await repository.fetchMovieDetails(movieId: 1);

    result.fold((left) => fail("test failed"), (right) {
      expect(right, movieDetailsEntity);
    });
  });

  test(
      'Should  return left Failure Message response in failed in top rated movies', () async {
    when(dataSource.fetchMovieDetails(movieId: 1))
        .thenAnswer((_) async =>
        Future.value(const Left(Failure("Server Error"))));

    final result = await repository.fetchMovieDetails(movieId: 1);

    result.fold((left) {
      expect(left, const Failure("Server Error"));
    }, (right) => fail('test failed'));
  });
}
