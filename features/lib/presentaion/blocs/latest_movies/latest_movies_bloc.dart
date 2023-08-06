import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/networking/failure.dart';

import 'package:dartz/dartz.dart';
import '../../../domain/entity/movie_entity.dart';
import '../../../domain/use_cases/fetch_latest_movies_use_case.dart';
import 'latest_movies_event.dart';
import 'latest_movies_state.dart';

class LatestMoviesBloc extends Bloc<LatestMoviesEvent, LatestMoviesState> {
  final FetchLatestMoviesUseCase useCase;
  StreamSubscription<Either<Failure, List<MovieEntity>>>? _itemsSubscription;

  LatestMoviesBloc(this.useCase) : super(LatestMoviesInitialState()) {
    on<StartStreamingLatestMovies>(_startStreaming);
    on<StopStreamingLatestMovies>(_stopStreaming);
    on<MoviesUpdated>(_handleMoviesUpdated);
  }

   _startStreaming(StartStreamingLatestMovies event, Emitter<LatestMoviesState> emit) async {
      emit(LatestMoviesLoadingState());
    await _itemsSubscription?.cancel();

    _itemsSubscription = useCase.execute().listen(
          (failureOrItems) {
        add(MoviesUpdated(failureOrItems));
      },
    );


  }
  void _stopStreaming(StopStreamingLatestMovies event, Emitter<LatestMoviesState> emit) async {
    await _itemsSubscription?.cancel();
  }

  void _handleMoviesUpdated(MoviesUpdated event, Emitter<LatestMoviesState> emit) async {
    event.data.fold(
            (failure) =>  emit(LatestMoviesErrorState(failure.message)),
            (items) => emit(LatestMoviesSuccessState(items))
    );


  }



  @override
  Future<void> close() {
    _itemsSubscription?.cancel();
    return super.close();
  }


}
