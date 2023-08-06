import 'package:bloc/bloc.dart';
import 'package:features/domain/use_cases/fetch_popular_movies_use_case.dart';

import 'popular_movies_event.dart';
import 'popular_movies_state.dart';
import 'package:dartz/dartz.dart';
class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final FetchPopularMoviesUseCase useCase;


  PopularMoviesBloc(this.useCase) : super(PopularMoviesInitialState()) {
    on<FetchPopularMovies>(_fetchPopularMovies);
  }

  void _fetchPopularMovies(FetchPopularMovies event, Emitter<PopularMoviesState> emit) async {
    emit(PopularMoviesLoadingState());
    var response = await useCase.execute();
    response.fold((error) {
      emit(PopularMoviesErrorState(error.message));
    }, (movies) {
      emit(PopularMoviesSuccessState(movies));
    });

  }
}
