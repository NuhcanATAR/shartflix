import 'package:provider/provider.dart';
import 'package:shartflix/feature/home/home_view.dart';
import 'package:shartflix/feature/home/provider/home_provider.dart';
import 'package:shartflix/product/core/base/base_state.dart';

abstract class HomeViewModel extends BaseState<HomeView> {
  @override
  void dispose() {
    context.watch<HomeProvider>().pageController.dispose();
    super.dispose();
  }
}
