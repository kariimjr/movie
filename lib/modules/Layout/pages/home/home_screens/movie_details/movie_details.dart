
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/apis/models/movie_response.dart';
import 'package:movie/core/extensions/extension.dart';
import 'package:movie/modules/layout/manager/layout_cubit.dart';
import 'package:movie/modules/layout/manager/layout_state.dart';
import 'package:movie/modules/layout/pages/home/home_screens/movie_details/widgets/info_widget.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) async{
       await cubit.getMovies();
      cubit.getSimilar(movie!);
    });

  }


  @override
  Widget build(BuildContext context) {
    movie ??= ModalRoute.of(context)!.settings.arguments as Movies;
    return BlocProvider(
      create: (BuildContext context) => cubit,
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (BuildContext context, LayoutState state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * (700 / 933),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(movie!.largeCoverImage!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Positioned.fill(
                              child: IgnorePointer(
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
                            ),
                          ],
                        ),
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        size: 40,
                                      ),
                                    ),
                                    BlocBuilder<LayoutCubit, LayoutState>(
                                      builder: (context, state) {
                                        return IconButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            cubit.makeMovieMarked();
                                          },
                                          icon: Icon(
                                            cubit.isMarked
                                                ? Icons.bookmark
                                                : Icons.bookmark_outline_rounded,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Center(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset('assets/images/play.png'),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                                  children: [
                                    Center(
                                      child: Text(
                                        movie!.title!,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Center(
                                      child: Text(
                                        '${movie!.year!}',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(
                                          MediaQuery.of(context).size.width *
                                              0.8,
                                          55, // fixed height
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadiusGeometry.circular(16),
                                        ),
                                        backgroundColor: Color(0xffE82626),
                                      ),
                                      onPressed: () {},
                                      child: Center(
                                        child: Text(
                                          'Watch',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Center(
                                child: InfoWidget(
                                  text: movie!.rating?.toStringAsFixed(1) ?? 'N/A', // Fixed the hardcoded 15
                                  icon: Icons.favorite,
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Center(
                                child: InfoWidget(
                                  text: '${movie!.runtime ?? 0}',
                                  icon: Icons.watch_later,
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
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
                        Text('Screen Shots'),
                        SizedBox(height: 9),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: CachedNetworkImage(
                            imageUrl: movie!.backgroundImage!,
                            placeholder: (context, url) => Container(
                              height: 200,
                              color: Colors.grey[300],
                            ),
                            errorWidget: (context, url, error) => Container(
                              height: 200,
                              color: Colors.grey[300],
                              child: Icon(Icons.error),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text('Similar'),
                        SizedBox(height: 11),
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
                              itemCount: 4,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.7,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12,
                              ),
                              itemBuilder: (context, index) {
                                return MovieCard(movie: cubit.similar[index]);
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Summary"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}