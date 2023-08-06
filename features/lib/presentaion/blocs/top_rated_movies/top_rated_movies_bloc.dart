import 'package:bloc/bloc.dart';

import '../../../domain/use_cases/fetch_top_rated_movies_use_case.dart';
import 'top_rated_movies_event.dart';
import 'top_rated_movies_state.dart';

class TopRatedMoviesBloc extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final FetchTopRatedMoviesUseCase useCase;
  TopRatedMoviesBloc(this.useCase) : super(TopRatedMoviesInitialState()) {
    on<FetchTopRatedMovies>(_fetchTopRatedMovies);
  }

  void _fetchTopRatedMovies(FetchTopRatedMovies event, Emitter<TopRatedMoviesState> emit) async {
    emit(TopRatedMoviesLoadingState());
    var response = await useCase.execute();
    response.fold((error) {
      emit(TopRatedMoviesErrorState(error.message));
    }, (movies) {
      emit(TopRatedMoviesSuccessState(movies));
    });
  }
}
