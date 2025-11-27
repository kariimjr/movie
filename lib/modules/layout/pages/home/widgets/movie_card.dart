import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/extensions/extension.dart';

import '../../../../../core/apis/models/movie_response.dart';
import '../../../../../core/routes/app_routes_name.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final Movies movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: (){
        Navigator.pushNamed(context, RouteName.MovieDetails, arguments: movie);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: movie.mediumCoverImage ?? '',
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(color: context.appColorTheme.primary,),
              errorWidget: (context, url, error) => Image.asset('assets/images/not_found_image.png', fit: BoxFit.cover,),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 11,
                left: 9,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 7,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  color: context.appColorTheme.secondary
                      .withValues(alpha: 0.6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${movie.rating!}'),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}