import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class PhotoUpdateEvent extends Equatable {
  const PhotoUpdateEvent();

  @override
  List<Object> get props => [];
}

class PhotoPickImage extends PhotoUpdateEvent {}

class UploadPhoto extends PhotoUpdateEvent {
  final File fileImg;

  const UploadPhoto(this.fileImg);

  @override
  List<Object> get props => [fileImg];
}
