import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lotteria2021/store/reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'page/home.dart';
import 'page/insertcore.dart';
import 'store/appstate.dart';

void main() => runApp(LotteriaScontrini());

class LotteriaScontrini extends StatefulWidget {
  @override
  _LotteriaScontriniState createState() => _LotteriaScontriniState();
}

class _LotteriaScontriniState extends State<LotteriaScontrini> {
  final Store<AppState> store = Store<AppState>(appStateReducer,
      initialState: AppState.initial(), middleware: [thunkMiddleware]);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          initialRoute: '/',
          theme: ThemeData.light(),
          routes: {'/': (context) => Home(), '/set': (context) => InsertCode()},
        ));
  }
}
