import 'package:core/networking/failure.dart';
import 'package:features/domain/entity/movie_entity.dart';
import 'package:features/domain/use_cases/fetch_latest_movies_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import '../../helpers/init_mocks.mocks.dart';

void main(){

  late MockMoviesRepositoryImpl repository;
  late FetchLatestMoviesUseCase useCase;


  setUp((){
    repository = MockMoviesRepositoryImpl();
    useCase = FetchLatestMoviesUseCase(repository);
  });

  List<MovieEntity> movies = [
    const MovieEntity(1, "title", "https://image.tmdb.org/t/p/w342posterPath"),
    const MovieEntity(
        2, "title2", "https://image.tmdb.org/t/p/w342posterPath2"),
  ];


  test('should get list of movies from the repository', () async {
    // arrange
    when(repository.fetchLatestMovies())
        .thenAnswer((_) async => right(movies));
    // act
      useCase.execute().listen((event) {

        expect(event, right(movies));
      });
    // assert

  }); test('should get Error the repository', () async {
    // arrange
    when(repository.fetchLatestMovies())
        .thenAnswer((_) async => const Left(Failure("Server Error")));
    // act
      useCase.execute().listen((event) {
        expect(event, const Left(Failure("Server Error")));
      });
    // assert

  });










}
