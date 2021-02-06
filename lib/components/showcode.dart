import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

import 'code.dart';

class ShowCode extends StatelessWidget {
  final String code;
  const ShowCode({@required this.code, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: BarcodeWidget(
              barcode: Barcode.code128(),
              height: 120,
              data: code,
              drawText: false,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
              "Mostra questo codice all'esercente prima di effettuare un pagamento. Partecipi solo se il tuo acquisto ha un importo maggiore o uguale a 1 euro."),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.black),
          child: SizedBox(
            height: 40,
            width: double.infinity,
          ),
        ),
        Container(
          child: Code(code: code),
        )
      ]),
    );
  }
}
