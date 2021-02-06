import 'package:flutter/material.dart';

class AppState {
  String code;
  bool loading = false;

  AppState({@required this.code, this.loading});

  factory AppState.initial() => AppState(code: "", loading: false);

  AppState.fromAppState(AppState another) {
    code = another.code;
    loading = another.loading;
  }
}
