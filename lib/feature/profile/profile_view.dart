import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/feature/profile/bloc/cubit.dart';
import 'package:shartflix/feature/profile/bloc/state.dart';
import 'package:shartflix/feature/profile/profile_viewmodel.dart';
import 'package:shartflix/feature/profile/provider/profile_provider.dart';
import 'package:shartflix/product/constants/icon_constant.dart';
import 'package:shartflix/product/theme/light_theme.dart';
import 'package:shartflix/product/util/util.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';
import 'package:shartflix/product/widget/widget/movie_min_card.dart';
import 'package:shartflix/product/widget/widget/pro_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  static String routeName = 'profile';
  static String routePath = '/profile';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ProfileViewModel {
  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: dynamicViewExtensions.dynamicHeight(context, 0.1),
        backgroundColor:
            CustomColorTheme().themeDataSecond.scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Container(
            width: 40,
            height: 40,
            padding: BaseUtility.all(BaseUtility.paddingSmallValue),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: const BorderRadius.all(
                Radius.circular(BaseUtility.radiusCircularHighValue),
              ),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: AppIcons.arrowLeft.toSvgImg(
              Colors.white,
              BaseUtility.iconMediumNormalSize,
              BaseUtility.iconMediumNormalSize,
            ),
          ),
        ),
        centerTitle: true,
        title: const BodyMediumWhiteBoldText(
          text: 'Profil Detayı',
          textAlign: TextAlign.center,
        ),
        actions: [ProButtonWidget(onTap: () {})],
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoaded) {
            return Padding(
              padding: BaseUtility.symmetric(
                BaseUtility.paddingSmallValue,
                BaseUtility.paddingNormalValue,
              ),
              child: ListView(
                children: <Widget>[
                  // profile
                  buildProfileWidget(state),
                  // favorite list
                  buildFavoriteListWidget(state, profileProvider),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  // profile
  Widget buildProfileWidget(ProfileLoaded state) => Padding(
    padding: BaseUtility.bottom(BaseUtility.paddingNormalValue),
    child: Row(
      children: <Widget>[
        // profile
        SizedBox(
          width: dynamicViewExtensions.dynamicWidth(context, 0.16),
          height: dynamicViewExtensions.dynamicWidth(context, 0.16),
          child: Container(
            decoration: BoxDecoration(
              color:
                  state.userModel.photoUrl.isEmpty ? Colors.white : Colors.red,
              borderRadius: const BorderRadius.all(
                Radius.circular(BaseUtility.radiusCircularHighValue),
              ),
            ),
          ),
        ),
        // name surname and id
        Expanded(
          flex: 3,
          child: Padding(
            padding: BaseUtility.horizontal(BaseUtility.paddingNormalValue),
            child: Column(
              children: <Widget>[
                // name surmame
                SizedBox(
                  width: dynamicViewExtensions.maxWidth(context),
                  child: Padding(
                    padding: BaseUtility.bottom(BaseUtility.paddingSmallValue),
                    child: BodyMediumWhiteBoldText(
                      text: state.userModel.name,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                // id
                SizedBox(
                  width: dynamicViewExtensions.maxWidth(context),
                  child: Padding(
                    padding: BaseUtility.bottom(BaseUtility.paddingSmallValue),
                    child: BodyMediumBlackText(
                      text: 'ID: ${state.userModel.id}',
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // photo update
        Flexible(
          fit: FlexFit.tight,
          flex: 3,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              margin: BaseUtility.horizontal(BaseUtility.paddingSmallValue),
              padding: BaseUtility.all(BaseUtility.paddingMediumValue),
              decoration: BoxDecoration(
                color: CustomColorTheme().themeData.primaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(BaseUtility.radiusNormalValue),
                ),
              ),
              child: const BodyMediumWhiteBoldText(
                text: 'Fotoğraf Ekle',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget buildFavoriteListWidget(
    ProfileLoaded state,
    ProfileProvider profileProvider,
  ) {
    if (state.movie.isEmpty) {
      return const SizedBox();
    }

    return Column(
      children: <Widget>[
        // title
        SizedBox(
          width: dynamicViewExtensions.maxWidth(context),
          child: const Padding(
            padding: EdgeInsetsGeometry.only(
              top: BaseUtility.paddingNormalValue,
              bottom: BaseUtility.paddingNormalHightValue,
            ),
            child: BodyMediumWhiteBoldText(
              text: 'Beğendiğim Filmler',
              textAlign: TextAlign.left,
            ),
          ),
        ),
        // movie list
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.7,
          ),
          itemCount: state.movie.length,
          itemBuilder: (context, index) {
            final movie = state.movie[index];
            return MovieMinCardWidget(
              movie: movie,
              profileProvider: profileProvider,
              dynamicViewExtensions: dynamicViewExtensions,
            );
          },
        ),
      ],
    );
  }
}
