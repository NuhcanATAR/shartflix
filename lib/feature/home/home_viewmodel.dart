import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shartflix/feature/home/bloc/bloc.dart';
import 'package:shartflix/feature/home/bloc/event.dart';
import 'package:shartflix/feature/home/bloc/state.dart';
import 'package:shartflix/feature/home/home_view.dart';
import 'package:shartflix/product/core/base/base_state.dart';

abstract class HomeViewModel extends BaseState<HomeView> {
  final PageController pageController = PageController();
  bool isFetchingMore = false;

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const HomeFetchMovies(page: 1));

    pageController.addListener(() {
      final bloc = context.read<HomeBloc>();
      final state = bloc.state;

      if (state is HomeLoaded &&
          pageController.position.pixels >=
              pageController.position.maxScrollExtent - 100 &&
          !isFetchingMore) {
        isFetchingMore = true;
        context.read<HomeBloc>().add(const HomeLoadMoreMovies());
        Future.delayed(const Duration(milliseconds: 300), () {
          isFetchingMore = false;
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
