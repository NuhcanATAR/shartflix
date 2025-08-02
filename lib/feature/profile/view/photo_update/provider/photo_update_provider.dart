import 'package:flutter/material.dart';
import 'package:shartflix/product/core/repository/profile_repository/profile_repository.dart';
import 'package:shartflix/product/model/user_model/user_model.dart';

class PhotoUpdateProvider extends ChangeNotifier {
  late UserModel userModel = UserModel(
    id: '',
    name: '',
    email: '',
    photoUrl: '',
  );
  PhotoUpdateProvider() {
    getUserInformation();
  }

  Future<void> getUserInformation() async {
    userModel = await ProfileRepository().getUser();

    notifyListeners();
  }
}
