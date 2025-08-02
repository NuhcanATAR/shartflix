import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class PhotoUpdateState extends Equatable {
  const PhotoUpdateState();

  @override
  List<Object> get props => [];
}

class PhotoUpdateInitial extends PhotoUpdateState {}

class PhotoPicking extends PhotoUpdateState {}

class PhotoPicked extends PhotoUpdateState {
  final File image;

  const PhotoPicked(this.image);

  @override
  List<Object> get props => [image];
}

class PhotoUpdateLoading extends PhotoUpdateState {}

class PhotoUpdateSuccess extends PhotoUpdateState {}

class PhotoUpdateError extends PhotoUpdateState {}
