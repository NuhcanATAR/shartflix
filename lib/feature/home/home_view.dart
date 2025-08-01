import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/feature/home/home_viewmodel.dart';
import 'package:shartflix/feature/home/provider/home_provider.dart';
import 'package:shartflix/product/constants/icon_constant.dart';
import 'package:shartflix/product/model/movie_model/movie_model.dart';
import 'package:shartflix/product/util/util.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';
import 'package:shartflix/product/widget/widget/expanded_label_text.dart';
import 'package:shartflix/product/widget/widget/favorite_button.dart';
import 'package:shartflix/product/widget/widget/movie_cover.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    return buildBodyWidget(homeProvider);
  }

  // body
  Widget buildBodyWidget(HomeProvider homeProvider) =>
      homeProvider.isLoading &&
              (homeProvider.movieData == null ||
                  homeProvider.movieData!.movies.isEmpty)
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
            onRefresh: homeProvider.onRefresh,
            child: PageView.builder(
              controller: homeProvider.pageController,
              scrollDirection: Axis.vertical,
              itemCount:
                  homeProvider.movieData!.movies.length +
                  (homeProvider.isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == homeProvider.movieData!.movies.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final movie = homeProvider.movieData!.movies[index];

                return Stack(
                  children: [
                    // cover image
                    buildCoverImageWidget(homeProvider, movie),
                    // footer
                    buildFooterWidget(homeProvider, movie),
                  ],
                );
              },
            ),
          );

  // cover image
  Widget buildCoverImageWidget(HomeProvider homeProvider, Movie movie) =>
      MovieCover(imgUrl: homeProvider.fixPosterUrl(movie.poster));

  // footer
  Widget buildFooterWidget(HomeProvider homeProvider, Movie movie) => Padding(
    padding: BaseUtility.symmetric(
      BaseUtility.paddingSmallValue,
      BaseUtility.paddingNormalValue,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // favorite button
        buildFavoriteButtonWidget(homeProvider, movie),
        // title and sub title
        buildTitleAndSubTitleWidget(movie),
      ],
    ),
  );

  // favorite button
  Widget buildFavoriteButtonWidget(
    HomeProvider homeProvider,
    Movie movie,
  ) => Container(
    margin: BaseUtility.bottom(BaseUtility.marginMediumValue),
    alignment: Alignment.centerRight,
    child: FavoriteButtonWidget(
      onTap: () async {
        await homeProvider.toggleFavoriteAndRefresh(context, movie.id ?? '');
      },
      color:
          homeProvider.isFavorite(movie.id ?? '') ? Colors.red : Colors.white,
    ),
  );

  // title and sub title
  Widget buildTitleAndSubTitleWidget(Movie movie) => Padding(
    padding: BaseUtility.top(BaseUtility.paddingNormalValue),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 40,
          height: 40,
          child: Container(
            padding: BaseUtility.all(BaseUtility.paddingSmallValue),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              border: Border.all(color: Colors.white, width: 1.5),
              borderRadius: const BorderRadius.all(
                Radius.circular(BaseUtility.radiusCircularHighValue),
              ),
            ),
            child: AppIcons.accountIcon.toSvgImg(
              Colors.white,
              BaseUtility.iconNormalSize,
              BaseUtility.iconNormalSize,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: BaseUtility.left(BaseUtility.paddingNormalValue),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: dynamicViewExtensions.maxWidth(context),
                  child: BodyMediumWhiteBoldText(
                    text: movie.title ?? '',
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  width: dynamicViewExtensions.maxWidth(context),
                  child: Padding(
                    padding: BaseUtility.bottom(BaseUtility.paddingSmallValue),
                    child: ExpandedLabelText(
                      text: movie.plot ?? '',
                      wordLimit: 9,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
