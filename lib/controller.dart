import 'package:mobx/mobx.dart';
import 'package:mobx_test/models/client.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  final client = Client();
  String validateName() {
    if (client.name == null || client.name.isEmpty) {
      return 'Este Campo é obrigatorio';
    } else if (client.name.length < 3) {
      return 'Seu nome precisa ter mais de 3 caracteres';
    }
    return null;
  }

  String validateEmail() {
    if (client.email == null || client.email.isEmpty) {
      return 'Este Campo é obrigatorio';
    } else if (!client.email.contains('@')) {
      return 'Este não é email valido';
    }
    return null;
  }

  String validateCpf() {
    if (client.cpf == null || client.cpf.isEmpty) {
      return 'Este Campo é obrigatorio';
    } else if (client.cpf.length < 11) {
      return 'Este não é email valido';
    }
    return null;
  }

  @computed
  bool get isValid {
    return validateName() == null && validateEmail() == null;
  }
}
