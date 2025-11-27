import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/extensions/extension.dart';

class CastCard extends StatelessWidget {
  final String? image;
  final String? name;
  final String? character;
  const CastCard({
    super.key,
    required this.name,
    required this.image,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.appColorTheme.secondary,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: image ?? '',
              placeholder: (context, url) =>
                  CircularProgressIndicator(color: context.appColorTheme.primary),
              errorWidget: (context, url, error) =>
                  Image.asset('assets/images/unkown.png', width: 100),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Name : $name"), Text("Character : $character")],
          ),
        ],
      ),
    );
  }
}
