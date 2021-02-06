import 'package:lotteria2021/store/actions.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'appstate.dart';

void storeMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is StartLoad) {
    store.state.loading = true;
    SharedPreferences.getInstance().then((pref) {
      try {
        store.dispatch(SetCode(pref.getString("code")));
      } catch (e) {} finally {
        store.dispatch(LoadingComplete());
      }
    });
  }

  if (action is SetCode) {
    SharedPreferences.getInstance().then((pref) {
      pref.setString("code", action.payload);
    });
  }
}
