import 'package:equatable/equatable.dart';

import '../../../domain/entity/movie_entity.dart';
abstract class UpcomingMoviesState extends Equatable {}


class UpcomingMoviesInitialState extends UpcomingMoviesState{
  @override
  List<Object?> get props => [];
}
class UpcomingMoviesLoadingState extends UpcomingMoviesState{
  @override
  List<Object?> get props => [];
}

class UpcomingMoviesSuccessState extends UpcomingMoviesState{
  final List<MovieEntity> movies;

  UpcomingMoviesSuccessState(this.movies);
  @override
  List<Object?> get props => [movies];
}

class UpcomingMoviesErrorState extends UpcomingMoviesState{
  final String errorMessage;

  UpcomingMoviesErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
