import 'package:core/networking/failure.dart';
import 'package:features/domain/entity/movie_entity.dart';
import 'package:features/presentaion/blocs/latest_movies/latest_movies_bloc.dart';
import 'package:features/presentaion/blocs/latest_movies/latest_movies_event.dart';
import 'package:features/presentaion/blocs/latest_movies/latest_movies_state.dart';
import 'package:features/presentaion/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:features/presentaion/blocs/popular_movies/popular_movies_event.dart';
import 'package:features/presentaion/blocs/popular_movies/popular_movies_state.dart';
import 'package:features/presentaion/blocs/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:features/presentaion/blocs/top_rated_movies/top_rated_movies_event.dart';
import 'package:features/presentaion/blocs/top_rated_movies/top_rated_movies_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import '../../helpers/init_mocks.mocks.dart';

main(){

  late MockFetchLatestMoviesUseCase usecase;
  late LatestMoviesBloc bloc;


  setUp((){
    usecase = MockFetchLatestMoviesUseCase();
    bloc = LatestMoviesBloc(usecase);
  });

  List<MovieEntity> movies = [
    const MovieEntity(1, "title", "https://image.tmdb.org/t/p/w342posterPath"),
    const MovieEntity(
        2, "title2", "https://image.tmdb.org/t/p/w342posterPath2"),
  ];


  tearDown(() {
    bloc.close();
  });

  test('initial state should be LatestMoviesInitial', () {
    // assert
    expect(bloc.state,  LatestMoviesInitialState());
  });

  group('FetchLatestMoviesEvent', () {
    test('should get data from the use case', () async {
      // arrange
      when(usecase.execute()).thenAnswer((_)  => Stream.value(right(movies)));
      // act
      bloc.add(StartStreamingLatestMovies());

        usecase.execute().listen((event) {
          bloc.add(MoviesUpdated(event));
        });

      // assert
    });


    test('should emit [LatestMoviesLoadingState, LatestMoviesLoadedState] when data is gotten successfully', () async {
      // arrange

      when(usecase.execute()).thenAnswer((_)  => Stream.value(right(movies)));
      // act
      bloc.add(StartStreamingLatestMovies());

      usecase.execute().listen((event) {
        bloc.add(MoviesUpdated(event));
      });

      // assert later
      final expected = [
        LatestMoviesLoadingState(),
        LatestMoviesSuccessState(movies),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(StartStreamingLatestMovies());
    });

    test('should emit [LatestMoviesLoadingState, LatestMoviesErrorState] when getting data fails', () async {
      // arrange
      when(usecase.execute()).thenAnswer((_)  => Stream.value(const Left(Failure("Server Error"))));
      // act
      bloc.add(StartStreamingLatestMovies());

      usecase.execute().listen((event) {
        bloc.add(MoviesUpdated(event));
      });      // assert later
      final expected = [
        LatestMoviesLoadingState(),
        LatestMoviesErrorState("Server Error"),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(StopStreamingLatestMovies());
    });
  });








}
