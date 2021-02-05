import 'dart:developer';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lotteria2021/store/actions.dart';
import 'package:lotteria2021/store/appstate.dart';
import 'package:lotteria2021/themecolor.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  void action(Store<String> store) async {
    log("action async");
    SharedPreferences.getInstance().then((pref) {
      try {
        log("ci sono");
        return new SetCode(pref.getString("code"));
      } catch (e) {
        return new LoadingComplete();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeLotteria,
        title: Text("LotteriaDegliScontrini"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/set');
            },
          )
        ],
      ),
      // drawer: DrawerMenu(),
      body: StoreConnector<AppState, AppState>(
        onInit: (store) {
          store.dispatch(action);
        },
        converter: (store) => store.state,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //     constraints: BoxConstraints(
                //         minWidth: double.infinity, maxHeight: 500),
                //     decoration: BoxDecoration(
                //       color: Color.fromRGBO(34, 86, 136, 1.0),
                //       borderRadius: BorderRadius.circular(10.0),
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                //       child: Text.rich(
                //           TextSpan(
                //               text: "Lotteria degli scontrini",
                //               style:
                //                   TextStyle(fontSize: 30, color: Colors.white)),
                //           textAlign: TextAlign.center),
                //     )),
                Container(
                  alignment: Alignment.center,
                  child: Image(image: AssetImage('assets/logo.png')),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                ),
                state.loading
                    ? CircularProgressIndicator()
                    : Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BarcodeWidget(
                              barcode: Barcode.code128(), data: state.code),
                        )),
              ],
            ),
          );
        },
      ),
    );
  }
}
