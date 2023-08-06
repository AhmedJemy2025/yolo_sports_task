import 'package:art_core/widgets/extensions/widgets_extensions.dart';
import 'package:features/domain/entity/movie_entity.dart';
import 'package:features/presentaion/pages/movie_details_page.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MovieItem extends StatelessWidget {
  final MovieEntity movie;

  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCupertinoModalBottomSheet(
          context: context,
          builder: (context) => Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: MediaQuery.of(context).size.height / 1.5,
              child: MovieDetailsPage(movieId: movie.id)),
        );
      },
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(movie.image), fit: BoxFit.cover)),
          ),
          Text(
            movie.title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          )
        ],
      ).marginSymmetric(horizontal: 5),
    );
  }
}
