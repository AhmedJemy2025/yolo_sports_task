import 'package:art_core/art_core.dart';
import 'package:art_core/widgets/extensions/widgets_extensions.dart';
import 'package:core/core.dart';
import 'package:features/presentaion/blocs/movie_details/movie_details_bloc.dart';
import 'package:features/presentaion/blocs/movie_details/movie_details_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../blocs/movie_details/movie_details_state.dart';

class MovieDetailsPage extends StatefulWidget {
  final int movieId;

  const MovieDetailsPage({super.key, required this.movieId});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  MovieDetailsBloc movieDetailsBloc = Modular.get<MovieDetailsBloc>();

  @override
  void initState() {
    movieDetailsBloc.add(FetchMovieDetails(widget.movieId));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
      bloc: movieDetailsBloc,
      listener: (context, state) {
        if (state is MovieDetailsErrorState) {
          showSnackBar(state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is MovieDetailsErrorState) {
          return ErrorView(
              onRetryClick: () =>
                  movieDetailsBloc.add(FetchMovieDetails(widget.movieId)),
              errorMessage: state.errorMessage);
        } else if (state is MovieDetailsSuccessState) {
          return Scaffold(
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 220,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(state.movie.poster),
                                fit: BoxFit.contain)),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppText(
                            text: state.movie.title,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          AppText(
                            text: state.movie.releaseYear,
                            fontSize: 16,
                            color: colorBlack,
                            fontWeight: FontWeight.w600,
                          ),
                          AppText(
                            text: state.movie.genres,
                            fontSize: 16,
                            color: colorDarkGrey,
                            fontWeight: FontWeight.w600,
                          ),
                          RatingBarIndicator(
                            rating: state.movie.voteAvg,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            unratedColor: Colors.amber.withOpacity(.4),
                            itemCount: 5,
                            itemSize: 20.0,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const AppText(
                  text: "Overview",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ).marginSymmetric(horizontal: 10 , vertical: 10),

                AppText(
                  text: state.movie.overview,
                  fontSize: 16,
                  maxLines: 5,
                  fontWeight: FontWeight.w500,

                ).marginSymmetric(horizontal: 10 ),
                const SizedBox(
                  height: 10,
                ),
                state.movie.hasVideo
                    ? InkWell(
                        onTap: () {
                          showSnackBar(state.movie.title);
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorPrimary.withOpacity(.2)),
                          child: const Icon(
                            Icons.play_arrow,
                            size: 25,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          );
        } else {
          return const AppLoading();
        }
      },
    );
  }
}
