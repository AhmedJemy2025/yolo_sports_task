import 'package:bloc/bloc.dart';

import '../../../domain/use_cases/fetch_movie_details_use_case.dart';
import 'movie_details_event.dart';
import 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final FetchMovieDetailsUseCase fetchMovieDetailsUseCase;


  MovieDetailsBloc(this.fetchMovieDetailsUseCase) : super(MovieDetailsInitialState()) {
    on<FetchMovieDetails>(_fetchMovieDetails);
  }

  void _fetchMovieDetails(FetchMovieDetails event, Emitter<MovieDetailsState> emit) async {
    emit(MovieDetailsLoadingState());
    final result = await fetchMovieDetailsUseCase.execute(movieId: event.movieId);
    result.fold(
      (failure) => emit(MovieDetailsErrorState(failure.message)),
      (movie) => emit(MovieDetailsSuccessState(movie)),
    );
    // emit(state.clone());
  }



}
