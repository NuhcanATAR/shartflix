import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/feature/home/bloc/bloc.dart';
import 'package:shartflix/feature/home/bloc/event.dart';
import 'package:shartflix/feature/home/bloc/state.dart';
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

  static String routeName = 'home';
  static String routePath = '/home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    final homeProvider = context.read<HomeProvider>();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading || state is HomeInitial) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is HomeError) {
          return const Center(child: Text("Error"));
        }

        if (state is HomeLoaded) {
          final movies = state.movies.movies;
          final favoriteIds = state.favoriteMovieIds;

          return RefreshIndicator(
            onRefresh: () async {
              context.read<HomeBloc>().add(const HomeRefreshMovies());
            },
            child: PageView.builder(
              controller: pageController,
              scrollDirection: Axis.vertical,
              itemCount: movies.length + 1,
              itemBuilder: (context, index) {
                if (index == movies.length) {
                  return const Center(child: CircularProgressIndicator());
                }

                final movie = movies[index];

                return Stack(
                  children: [
                    MovieCover(
                      imgUrl: homeProvider.fixPosterUrl(movie.poster ?? ''),
                    ),
                    _buildFooter(context, movie, favoriteIds),
                  ],
                );
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }

  Widget _buildFooter(
    BuildContext context,
    Movie movie,
    List<String> favoriteIds,
  ) {
    final isFavorite = favoriteIds.contains(movie.id);

    return Padding(
      padding: BaseUtility.symmetric(
        BaseUtility.paddingSmallValue,
        BaseUtility.paddingNormalValue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.centerRight,
            margin: BaseUtility.bottom(BaseUtility.marginMediumValue),
            child: FavoriteButtonWidget(
              onTap: () {
                context.read<HomeBloc>().add(
                  HomeToggleFavorite(movie.id ?? ''),
                );
              },
              color: isFavorite ? Colors.red : Colors.white,
            ),
          ),
          Padding(
            padding: BaseUtility.top(BaseUtility.paddingNormalValue),
            child: Row(
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
                      borderRadius: BorderRadius.circular(
                        BaseUtility.radiusCircularHighValue,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BodyMediumWhiteBoldText(
                          text: movie.title ?? '',
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: BaseUtility.bottom(
                            BaseUtility.paddingSmallValue,
                          ),
                          child: ExpandedLabelText(
                            text: movie.plot ?? '',
                            wordLimit: 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
