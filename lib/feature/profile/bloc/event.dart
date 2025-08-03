import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadProfile extends ProfileEvent {
  final BuildContext context;

  LoadProfile({required this.context});

  @override
  List<Object> get props => [context];
}
