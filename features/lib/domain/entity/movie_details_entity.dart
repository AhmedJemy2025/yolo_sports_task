import 'package:equatable/equatable.dart';
class MovieDetailsEntity extends Equatable{
  final int id;

  final String title ;
  final String poster;
  final double voteAvg;
  final String overview;
  final String genres;
  final String releaseYear;
  final bool hasVideo;

  const MovieDetailsEntity( this.id,this.title, this.poster, this.voteAvg, this.overview, this.genres, this.releaseYear, this.hasVideo);

  @override
  List<Object?> get props =>[
    id,
    title,
    poster,
    voteAvg,
    overview,
    genres,
    releaseYear,
    hasVideo
  ];

}
