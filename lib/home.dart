import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_test/controller.dart';

class Home extends StatelessWidget {
  final controller = Controller();
  _textField({String label, onChanged, String Function() erroText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          errorText: erroText == null ? null : erroText()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Estudo de MobX'),
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Observer(builder: (_) {
                  return _textField(
                      label: 'Nome',
                      onChanged: controller.client.changeName,
                      erroText: controller.validateName);
                }),
                SizedBox(
                  height: 15,
                ),
                Observer(builder: (_) {
                  return _textField(
                      label: 'Email',
                      onChanged: controller.client.changeEmail,
                      erroText: controller.validateEmail);
                }),
                SizedBox(
                  height: 15,
                ),
                Observer(builder: (_) {
                  return _textField(
                      label: 'Cpf',
                      onChanged: controller.client.changeCpf,
                      erroText: controller.validateCpf);
                }),
                Observer(builder: (_) {
                  return OutlineButton(
                    onPressed: controller.isValid ? () {} : null,
                    child: Text('SAVE'),
                  );
                })
              ],
            )));
  }
}
