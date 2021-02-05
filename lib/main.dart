import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lotteria2021/store/reducer.dart';
import 'package:redux/redux.dart';

import 'page/home.dart';
import 'page/insertcore.dart';
import 'store/appstate.dart';

void main() => runApp(LotteriaScontrini());

class LotteriaScontrini extends StatelessWidget {
  final Store<AppState> store =
      Store<AppState>(appStateReducer, initialState: AppState.initial());

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          initialRoute: store.state.code == "" ? '/set' : '/',
          routes: {'/': (context) => Home(), '/set': (context) => InsertCode()},
        ));
  }
}
