import 'package:core/networking/failure.dart';
import 'package:features/domain/entity/movie_entity.dart';
import 'package:features/presentaion/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:features/presentaion/blocs/popular_movies/popular_movies_event.dart';
import 'package:features/presentaion/blocs/popular_movies/popular_movies_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import '../../helpers/init_mocks.mocks.dart';

main(){

  late MockFetchPopularMoviesUseCase usecase;
  late PopularMoviesBloc bloc;


  setUp((){
    usecase = MockFetchPopularMoviesUseCase();
    bloc = PopularMoviesBloc(usecase);
  });

  List<MovieEntity> movies = [
    const MovieEntity(1, "title", "https://image.tmdb.org/t/p/w342posterPath"),
    const MovieEntity(
        2, "title2", "https://image.tmdb.org/t/p/w342posterPath2"),
  ];


  tearDown(() {
    bloc.close();
  });

  test('initial state should be PopularMoviesInitial', () {
    // assert
    expect(bloc.state,  PopularMoviesInitialState());
  });

  group('FetchPopularMoviesEvent', () {
    test('should get data from the use case', () async {
      // arrange
      when(usecase.execute()).thenAnswer((_) async => right(movies));
      // act
      bloc.add(FetchPopularMovies());
      await untilCalled(usecase.execute());
      // assert
      verify(usecase.execute());
    });

    test('should emit [PopularMoviesLoadingState, PopularMoviesLoadedState] when data is gotten successfully', () async {
      // arrange
      when(usecase.execute()).thenAnswer((_) async => Right(movies));
      // assert later
      final expected = [
        PopularMoviesLoadingState(),
        PopularMoviesSuccessState(movies),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(FetchPopularMovies());
    });

    test('should emit [PopularMoviesLoadingState, PopularMoviesErrorState] when getting data fails', () async {
      // arrange
      when(usecase.execute()).thenAnswer((_) async => const Left(Failure("Server Error")));
      // assert later
      final expected = [
        PopularMoviesLoadingState(),
        PopularMoviesErrorState("Server Error"),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(FetchPopularMovies());
    });
  });








}
