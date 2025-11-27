import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/extensions/extension.dart';
import 'package:movie/modules/layout/pages/home/home_screens/movie_details/widgets/cast_card.dart';
import 'package:movie/modules/layout/pages/home/home_screens/movie_details/widgets/info_widget.dart';
import '../../../../../../core/apis/models/movie_response.dart';
import '../../../../manager/layout_cubit.dart';
import '../../../../manager/layout_state.dart';
import '../../widgets/movie_card.dart';

class MovieDetails extends StatefulWidget {
  MovieDetails({super.key});
  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  Movies? movie;
  late LayoutCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = LayoutCubit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      movie = ModalRoute.of(context)!.settings.arguments as Movies?;
      await cubit.getMovies();
      if (movie != null) {
        cubit.getSimilar(movie!);
        await cubit.checkIfMovieMarked(movie!);
        await cubit.getMovieDetails(movie!.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    movie ??= ModalRoute.of(context)!.settings.arguments as Movies?;
    return BlocProvider(
      create: (BuildContext context) => cubit,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<LayoutCubit, LayoutState>(
                builder: (BuildContext context, LayoutState state) {
                  if (movie == null) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: context.appColorTheme.primary,
                      ),
                    );
                  } else {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(movie!.largeCoverImage!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.center,
                                  colors: [
                                    context.appColorTheme.surface,
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        color: Colors.white,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          size: 32,
                                        ),
                                      ),
                                      BlocBuilder<LayoutCubit, LayoutState>(
                                        builder: (context, state) {
                                          return IconButton(
                                            color: Colors.white,
                                            onPressed: () {
                                              if (movie != null) cubit.makeMovieMarked(movie!);
                                            },
                                            icon: Icon(
                                              cubit.isMarked ? Icons.bookmark : Icons.bookmark_outline,
                                              size: 32,
                                              color: Colors.white,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {

                                    },
                                    child: Image.asset(
                                      'assets/images/play.png',
                                      height: 64,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Center(
                                        child: Text(
                                          movie!.title ?? '',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Center(
                                        child: Text(
                                          '${movie!.year ?? ''}',
                                          style: TextStyle(color: Colors.white70),
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(
                                            MediaQuery.of(context).size.width * 0.8,
                                            52,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          backgroundColor: Color(0xffE82626),
                                        ),
                                        onPressed: () {
                                          cubit.addToHistory(movie!);
                                        },
                                        child: Center(
                                          child: Text(
                                            'Watch',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              BlocBuilder<LayoutCubit, LayoutState>(
                builder: (BuildContext context, state) {
                  if (state is GetMovieDetailsLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: context.appColorTheme.primary,
                      ),
                    );
                  } else if (state is GetMovieDetailsSuccessState) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Center(
                                  child: InfoWidget(
                                    text: movie!.rating?.toStringAsFixed(1) ?? 'N/A',
                                    icon: Icons.favorite,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Center(
                                  child: InfoWidget(
                                    text: '${movie!.runtime ?? 0}',
                                    icon: Icons.watch_later,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Center(
                                  child: InfoWidget(
                                    text: movie!.rating?.toStringAsFixed(1) ?? 'N/A',
                                    icon: Icons.star,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text('Screen Shots', style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height * 0.18,
                              width: double.infinity,
                              imageUrl: cubit.movieDetails?.largeScreenshotImage1 ?? '',
                              placeholder: (context, url) => Container(
                                height: MediaQuery.of(context).size.height * 0.18,
                                color: Colors.grey[300],
                              ),
                              errorWidget: (context, url, error) => Container(
                                height: MediaQuery.of(context).size.height * 0.18,
                                color: Colors.grey[300],
                                child: Icon(Icons.error),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height * 0.18,
                              width: double.infinity,
                              imageUrl: cubit.movieDetails?.largeScreenshotImage2 ?? '',
                              placeholder: (context, url) => Container(
                                height: MediaQuery.of(context).size.height * 0.18,
                                color: Colors.grey[300],
                              ),
                              errorWidget: (context, url, error) => Container(
                                height: MediaQuery.of(context).size.height * 0.18,
                                color: Colors.grey[300],
                                child: Icon(Icons.error),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height * 0.18,
                              width: double.infinity,
                              imageUrl: cubit.movieDetails?.largeScreenshotImage3 ?? '',
                              placeholder: (context, url) => Container(
                                height: MediaQuery.of(context).size.height * 0.18,
                                color: Colors.grey[300],
                              ),
                              errorWidget: (context, url, error) => Container(
                                height: MediaQuery.of(context).size.height * 0.18,
                                color: Colors.grey[300],
                                child: Icon(Icons.error),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text('Similar', style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          BlocBuilder<LayoutCubit, LayoutState>(
                            builder: (context, state) {
                              if (state is GetSimilarLoading) {
                                return Center(child: CircularProgressIndicator());
                              } else if (cubit.similar.isEmpty) {
                                return Center(child: Text('No similar movies found'));
                              }
                              return GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: min(4, cubit.similar.length),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.62,
                                  mainAxisSpacing: 12,
                                  crossAxisSpacing: 12,
                                ),
                                itemBuilder: (context, index) {
                                  return Transform.translate(
                                    offset: Offset(0, -20),
                                    child: MovieCard(
                                      movie: cubit.similar[index],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          SizedBox(height: 16),
                          Text("Summary", style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          Center(
                            child: Text(
                              (cubit.movieDetails?.descriptionFull?.isEmpty ?? true)
                                  ? "No description 😑"
                                  : cubit.movieDetails!.descriptionFull!,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text("Cast", style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          cubit.movieDetails?.cast != null && cubit.movieDetails!.cast!.isNotEmpty
                              ? Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: cubit.movieDetails!.cast!
                                .map((c) => CastCard(
                              name: c.name,
                              image: c.urlSmallImage,
                              character: c.characterName,
                            ))
                                .toList(),
                          )
                              : Center(child: Text("No Cast Exist 😑")),
                          SizedBox(height: 16),
                          Text('Genres', style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: movie?.genres?.length ?? 0,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 2.8,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                            ),
                            itemBuilder: (context, index) {
                              final genre = movie!.genres![index];
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: context.appColorTheme.secondary.withValues(alpha: 0.6),
                                      ),
                                      child: Center(
                                        child: Text(
                                          genre,
                                          maxLines: 1,
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 24),
                        ],
                      ),
                    );
                  } else if (state is GetMovieDetailsErrorState) {
                    return Icon(
                      Icons.error,
                      color: context.appColorTheme.primary,
                    );
                  } else {
                    return SizedBox();
                  }
                },
                buildWhen: (previous, current) {
                  return current is GetMovieDetailsSuccessState ||
                      current is GetMovieDetailsErrorState ||
                      current is GetMovieDetailsLoadingState;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
