import 'package:flutter/material.dart';
import 'package:shartflix/feature/profile/provider/profile_provider.dart';
import 'package:shartflix/product/extension/dynamic_extension.dart';
import 'package:shartflix/product/model/movie_model/movie_model.dart';
import 'package:shartflix/product/util/util.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';

class MovieMinCardWidget extends StatelessWidget {
  const MovieMinCardWidget({
    super.key,
    required this.movie,
    required this.profileProvider,
    required this.dynamicViewExtensions,
  });

  final Movie movie;
  final ProfileProvider profileProvider;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: BaseUtility.all(BaseUtility.paddingSmallValue),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadiusGeometry.all(
                Radius.circular(BaseUtility.radiusNormalValue),
              ),
              child:
                  movie.poster != null
                      ? Image.network(
                        profileProvider.fixPosterUrl(movie.poster!),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                      : Container(
                        color: Colors.grey,
                        child: const Center(
                          child: Icon(
                            Icons.movie,
                            size: BaseUtility.iconNormalSize,
                            color: Colors.white,
                          ),
                        ),
                      ),
            ),
          ),
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Padding(
              padding: BaseUtility.top(BaseUtility.paddingSmallValue),
              child: BodyMediumWhiteText(
                text: movie.title ?? '',
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(
            width: dynamicViewExtensions.maxWidth(context),
            child: Padding(
              padding: BaseUtility.bottom(BaseUtility.paddingSmallValue),
              child: BodyMediumBlackText(
                text: movie.director ?? '',
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
