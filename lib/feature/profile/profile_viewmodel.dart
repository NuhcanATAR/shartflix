import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/feature/profile/bloc/cubit.dart';
import 'package:shartflix/feature/profile/bloc/event.dart';
import 'package:shartflix/feature/profile/profile_view.dart';
import 'package:shartflix/product/core/base/base_state.dart';

abstract class ProfileViewModel extends BaseState<ProfileView> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(LoadProfile());
  }
}
