import 'package:lotteria2021/store/appstate.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'actions.dart';

AppState appStateReducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);

  if (action is SetCode) {
    newState.code = action.payload?.toUpperCase();
    newState.loading = false;
    SharedPreferences.getInstance()
        .then((value) => value.setString('code', newState.code));
  }
  if (action is StartLoad) {
    newState.loading = true;
    SharedPreferences.getInstance().then((pref) {
      final code = pref.getString('code');
      action.complete(code);
    });
  }
  if (action is LoadingComplete) {
    newState.loading = false;
  }
  return newState;
}
