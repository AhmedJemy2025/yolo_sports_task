import 'package:core/networking/failure.dart';
import 'package:features/domain/entity/movie_details_entity.dart';
import 'package:features/domain/entity/movie_entity.dart';
import 'package:features/presentaion/blocs/movie_details/movie_details_bloc.dart';
import 'package:features/presentaion/blocs/movie_details/movie_details_bloc.dart';
import 'package:features/presentaion/blocs/movie_details/movie_details_event.dart';
import 'package:features/presentaion/blocs/movie_details/movie_details_state.dart';
import 'package:features/presentaion/blocs/popular_movies/popular_movies_bloc.dart';
import 'package:features/presentaion/blocs/popular_movies/popular_movies_event.dart';
import 'package:features/presentaion/blocs/popular_movies/popular_movies_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import '../../helpers/init_mocks.mocks.dart';

main(){

  late MockFetchMovieDetailsUseCase usecase;
  late MovieDetailsBloc bloc;


  setUp((){
    usecase = MockFetchMovieDetailsUseCase();
    bloc = MovieDetailsBloc(usecase);
  });

  MovieDetailsEntity movieDetailsEntity = const MovieDetailsEntity(
      1,
      "title",
      "https://image.tmdb.org/t/p/w342posterPath",
      1,
      "overview",
      "name, name2",
      "2020",
      false);

  tearDown(() {
    bloc.close();
  });

  test('initial state should be MovieDetailsInitial', () {
    // assert
    expect(bloc.state,  MovieDetailsInitialState());
  });

  group('FetchMovieDetailsEvent', () {
    test('should get data from the use case', () async {
      // arrange
      when(usecase.execute(movieId: 1)).thenAnswer((_) async => right(movieDetailsEntity));
      // act
      bloc.add(FetchMovieDetails(1));
      await untilCalled(usecase.execute(movieId: 1));
      // assert
      verify(usecase.execute(movieId: 1));
    });

    test('should emit [MovieDetailsLoadingState, MovieDetailsLoadedState] when data is gotten successfully', () async {
      // arrange
      when(usecase.execute(movieId: 1)).thenAnswer((_) async => right(movieDetailsEntity));
      // assert later
      final expected = [
        MovieDetailsLoadingState(),
        MovieDetailsSuccessState(movieDetailsEntity),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(FetchMovieDetails(1));
    });

    test('should emit [MovieDetailsLoadingState, MovieDetailsErrorState] when getting data fails', () async {
      // arrange
      when(usecase.execute(movieId: 1)).thenAnswer((_) async => const Left(Failure("Server Error")));
      // assert later
      final expected = [
        MovieDetailsLoadingState(),
        MovieDetailsErrorState("Server Error"),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(FetchMovieDetails(1));
    });
  });








}
