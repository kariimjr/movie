import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/core/apis/models/movie_response.dart';
import 'package:movie/core/extensions/extension.dart';
import 'package:movie/modules/Layout/pages/home/widgets/movie_card.dart';
import 'package:movie/modules/Layout/pages/manager/layout_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late LayoutCubit cubit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    cubit = context.watch<LayoutCubit>();

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: cubit.movies[cubit.currentIndex].largeCoverImage!,
                  fit: BoxFit.cover,
                ),
              ),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/images/available_now.png'),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: CarouselSlider.builder(
                        itemCount: cubit.movies.length,
                        itemBuilder: (context, index, realIdx) {
                          final movie = cubit.movies[index];
                          return MovieCard(movie: movie,);
                        },
                        options: CarouselOptions(
                          height: 350,
                          viewportFraction: 0.6,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.25,
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            cubit.onCarouselChanged(index);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Image.asset('assets/images/watch_now.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: cubit.genres.map((genre) {
                final filteredMovies = cubit.movies
                    .where((m) => m.genres!.contains(genre))
                    .toList();
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(genre),
                          Row(
                            children: [
                              Text(
                                'See More',
                                style: context.appTextTheme.labelSmall!
                                    .copyWith(
                                      color: context.appColorTheme.primary,
                                    ),
                              ),
                              SizedBox(width: 2),
                              Icon(
                                Icons.arrow_forward,
                                color: context.appColorTheme.primary,
                                size: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: filteredMovies.length,
                          itemBuilder: (context, index) {
                            final movie = filteredMovies[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: MovieCard(movie: movie),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}


