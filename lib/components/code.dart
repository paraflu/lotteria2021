import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lotteria2021/themecolor.dart';

class Code extends StatelessWidget {
  final String code;
  const Code({@required this.code, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    final style = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w400,
      color: Colors.white,
      backgroundColor: themeLotteria,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ...code.characters.map((element) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Container(
              width: 25,
              decoration: BoxDecoration(color: themeLotteria),
              child: Center(
                child: Text(
                  element,
                  style: style,
                ),
              ),
            ),
          );
        })
      ],
    );
  }
}
