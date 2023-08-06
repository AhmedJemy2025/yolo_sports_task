import 'package:core/networking/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/entity/movie_entity.dart';
abstract class LatestMoviesEvent extends Equatable {}

class StartStreamingLatestMovies extends LatestMoviesEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class StopStreamingLatestMovies extends LatestMoviesEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class MoviesUpdated extends LatestMoviesEvent {
  final Either<Failure , List<MovieEntity>> data;

  MoviesUpdated(this.data);

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}
