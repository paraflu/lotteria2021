import 'package:flutter/material.dart';
import 'package:lotteria2021/themecolor.dart';

class Code extends StatelessWidget {
  final String code;
  const Code({@required this.code, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w400,
      backgroundColor: themeLotteria,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ...code.characters.map((element) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Container(
              decoration: BoxDecoration(color: themeLotteria),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
