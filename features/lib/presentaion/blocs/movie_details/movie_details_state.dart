import 'package:equatable/equatable.dart';
import 'package:features/domain/entity/movie_details_entity.dart';

import '../../../domain/entity/movie_entity.dart';
abstract class MovieDetailsState extends Equatable {}


class MovieDetailsInitialState extends MovieDetailsState{
  @override
  List<Object?> get props => [];
}
class MovieDetailsLoadingState extends MovieDetailsState{
  @override
  List<Object?> get props => [];
}

class MovieDetailsSuccessState extends MovieDetailsState{
  final MovieDetailsEntity movie;

  MovieDetailsSuccessState(this.movie);
  @override
  List<Object?> get props => [movie];
}

class MovieDetailsErrorState extends MovieDetailsState{
  final String errorMessage;

  MovieDetailsErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
