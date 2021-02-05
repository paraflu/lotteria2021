import 'package:flutter/material.dart';

class AppState {
  String code;

  AppState({@required this.code});

  factory AppState.initial() => AppState(code: "");

  AppState.fromAppState(AppState another) {
    code = another.code;
  }
}
