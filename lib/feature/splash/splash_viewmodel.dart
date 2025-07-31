import 'package:shartflix/feature/splash/splash_view.dart';
import 'package:shartflix/product/core/base/base_state.dart';

abstract class SplashViewModel extends BaseState<SplashView> {
  @override
  void initState() {
    super.initState();
    autoRouteControl();
  }

  void autoRouteControl() {}
}
