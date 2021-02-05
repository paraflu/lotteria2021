import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lotteria2021/store/actions.dart';
import 'package:lotteria2021/themecolor.dart';
import '../store/appstate.dart';

class InsertCode extends StatelessWidget {
  const InsertCode({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeLotteria,
          title: Text("LotteriaDegliScontriniInsertCode"),
        ),
        body: StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (context, state) {
              return Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("InsertCode"),
                        TextFormField(
                          initialValue: state.code,
                          decoration:
                              const InputDecoration(hintText: "InsertCodeHere"),
                          validator: (value) {
                            if (value.isEmpty || value.length != 8) {
                              return "InsertCodeMinLength8";
                            }
                            return null;
                          },
                          onSaved: (String code) {
                            StoreProvider.of<AppState>(context)
                                .dispatch(SetCode(code));
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                Navigator.pushNamed(context, '/');
                              }
                            },
                            child: Text('Submit'),
                          ),
                        ),
                      ],
                    ),
                  ));
            }));
  }
}
