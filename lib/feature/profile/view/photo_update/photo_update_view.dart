import 'package:flutter/material.dart';
import 'package:shartflix/feature/profile/view/photo_update/photo_update_viewmodel.dart';

class PhotoUpdateView extends StatefulWidget {
  const PhotoUpdateView({super.key});

  static String routeName = 'photo_update';
  static String routePath = '/photo_update';

  @override
  State<PhotoUpdateView> createState() => _PhotoUpdateViewState();
}

class _PhotoUpdateViewState extends PhotoUpdateViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Photo Update View")));
  }
}
