import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/feature/profile/view/photo_update/bloc/mixin.dart';
import 'package:shartflix/feature/profile/view/photo_update/photo_update_view.dart';
import 'package:shartflix/feature/profile/view/photo_update/provider/photo_update_provider.dart';
import 'package:shartflix/product/core/base/base_state.dart';

abstract class PhotoUpdateViewModel extends BaseState<PhotoUpdateView>
    with PhotoUpdateMixin {
  @override
  void initState() {
    super.initState();
    context.read<PhotoUpdateProvider>().getUserInformation();
  }
}
