import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shartflix/feature/authentication/sign_in/sign_in_view.dart';
import 'package:shartflix/feature/navigation_bar/navigation_bar_view.dart';
import 'package:shartflix/feature/splash/splash_view.dart';
import 'package:shartflix/product/core/base/base_state.dart';
import 'package:shartflix/product/core/helper/navigator_router.dart';

abstract class SplashViewModel extends BaseState<SplashView> {
  @override
  void initState() {
    super.initState();
    autoRouteControl();
  }

  Future<void> autoRouteControl() async {
    Future.delayed(const Duration(seconds: 3), () async {
      const storage = FlutterSecureStorage();
      final token = await storage.read(key: 'auth_token');

      if (!mounted) return;
      CodeNoahNavigatorRouter.pushNamedAndRemoveUntil(
        context,
        token != null ? NavigationBarView.routePath : SignInView.routePath,
      );
    });
  }
}
