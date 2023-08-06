import 'package:equatable/equatable.dart';
class MovieEntity extends Equatable{
  final int id;

  final String title ;
  final String image;

  const MovieEntity( this.id,this.title, this.image);

  @override
  // TODO: implement props
  List<Object?> get props =>[
    id,
    title,
    image
  ];

}
