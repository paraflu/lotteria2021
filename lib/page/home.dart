import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lotteria2021/components/showcode.dart';
import 'package:lotteria2021/store/actions.dart';
import 'package:lotteria2021/store/appstate.dart';
import 'package:lotteria2021/themecolor.dart';
import 'package:package_info/package_info.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String code;
  PackageInfo _packageInfo;

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeLotteria,
        title: Text("Lotteria degli scrontrini 🇮🇹"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/set');
            },
          )
        ],
      ),
      body: StoreConnector<AppState, AppState>(
        onInit: (store) {
          store.dispatch(StartLoad((_code) {
            setState(() {
              code = _code;
            });
            if (_code != null && _code.isNotEmpty) {
              store.dispatch(SetCode(_code));
            } else {
              store.dispatch(LoadingComplete());
            }
          }));
        },
        converter: (store) => store.state,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Image(image: AssetImage('assets/logo.png')),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(left: 20, top: 20),
                // ),
                state.loading
                    ? Center(child: CircularProgressIndicator())
                    : state.code.isNotEmpty
                        ? ShowCode(code: state.code)
                        : RaisedButton(
                            child: Row(children: [
                              Icon(Icons.settings),
                              Text('Inserisci il codice')
                            ]),
                            onPressed: () {
                              Navigator.pushNamed(context, '/set');
                            },
                          ),
                Expanded(
                    child: Container(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(_packageInfo != null
                              ? "ver. " + _packageInfo.version
                              : ''),
                        )))
              ],
            ),
          );
        },
      ),
    );
  }
}
