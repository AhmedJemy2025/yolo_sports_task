import 'package:bloc/bloc.dart';

import '../../../domain/use_cases/fetch_upcoming_movies_use_case.dart';
import 'upcoming_movies_event.dart';
import 'upcoming_movies_state.dart';

class UpcomingMoviesBloc extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final FetchUpcomingMoviesUseCase useCase;
  UpcomingMoviesBloc(this.useCase) : super(UpcomingMoviesInitialState()) {
    on<FetchUpcomingMovies>(_fetchUpcomingMovies);
  }

  void _fetchUpcomingMovies(FetchUpcomingMovies event, Emitter<UpcomingMoviesState> emit) async {
    emit(UpcomingMoviesLoadingState());
    var response = await useCase.execute();
    response.fold((error) {
      emit(UpcomingMoviesErrorState(error.message));
    }, (movies) {
      emit(UpcomingMoviesSuccessState(movies));
    });
  }
}
