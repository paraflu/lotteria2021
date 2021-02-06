import 'package:lotteria2021/store/appstate.dart';

class SetCode {
  final String payload;
  SetCode(this.payload);
}

typedef LoadCompleteCallback = void Function(String);

class StartLoad {
  final LoadCompleteCallback complete;
  StartLoad(this.complete);
}

class SaveState {}

class LoadingComplete {}
