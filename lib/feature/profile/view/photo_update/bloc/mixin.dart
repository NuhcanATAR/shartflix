import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/feature/authentication/sign_in/provider/sign_in_provider.dart';
import 'package:shartflix/feature/navigation_bar/navigation_bar_view.dart';
import 'package:shartflix/feature/profile/bloc/cubit.dart';
import 'package:shartflix/feature/profile/bloc/event.dart';
import 'package:shartflix/feature/profile/view/photo_update/bloc/state.dart';
import 'package:shartflix/feature/profile/view/photo_update/provider/photo_update_provider.dart';
import 'package:shartflix/product/core/helper/navigator_router.dart';
import 'package:shartflix/product/core/helper/show_dialogs.dart';
import 'package:shartflix/product/widget/text_widget/body_medium_text.dart';

mixin PhotoUpdateMixin {
  void photoUpdateListener(BuildContext context, PhotoUpdateState state) {
    if (state is PhotoUpdateSuccess) {
      if (context.read<SignInProvider>().isPhotoUpdateControl == true) {
        Navigator.pop(context);
        CodeNoahNavigatorRouter.pushNamedAndRemoveUntil(
          context,
          NavigationBarView.routePath,
        );
        CodeNoahDialogs(context).showFlush(
          type: SnackType.success,
          message: 'Profil Fotoğrafı Güncellendi!',
        );
      } else {
        Navigator.pop(context);
        Navigator.pop(context);
        CodeNoahDialogs(context).showFlush(
          type: SnackType.success,
          message: 'Profil Fotoğrafı Güncellendi!',
        );
      }

      context.read<ProfileBloc>().add(LoadProfile());
      context.read<PhotoUpdateProvider>().getUserInformation();
    } else if (state is PhotoUpdateError) {
      Navigator.pop(context);
      CodeNoahDialogs(context).showFlush(
        type: SnackType.error,
        message: 'Hata oluştu, lütfen daha sonra tekrar deneyiniz!',
      );
    } else if (state is PhotoUpdateLoading) {
      CodeNoahDialogs(context).showAlert(
        const BodyMediumWhiteBoldText(
          text: 'Fotoğraf Yükleniyor Lütfen Bekleyiniz...',
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}
