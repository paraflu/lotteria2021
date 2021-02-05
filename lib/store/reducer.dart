import 'package:lotteria2021/store/appstate.dart';

import 'actions.dart';

AppState appStateReducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);

  if (action is SetCode) {
    newState.code = action.payload;
  }
  if (action is StartLoad) {
    newState.loading = true;
  }
  if (action is LoadingComplete) {
    newState.loading = false;
  }
  return newState;
}
