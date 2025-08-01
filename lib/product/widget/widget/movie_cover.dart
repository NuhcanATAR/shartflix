import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieCover extends StatelessWidget {
  const MovieCover({super.key, required this.imgUrl});

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 0,
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        fit: BoxFit.cover,
        errorWidget:
            (context, url, error) => const Icon(Icons.broken_image, size: 50),
      ),
    );
  }
}
