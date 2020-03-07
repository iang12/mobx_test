import 'package:mobx/mobx.dart';
part 'client.g.dart';

class Client = _ClientBase with _$Client;

abstract class _ClientBase with Store {
  @observable
  String name;
  @action
  changeName(String value) => name = value;
  @observable
  String email;
  changeEmail(String value) => email = value;
  @observable
  String cpf;
  changeCpf(String value) => cpf = value;
}
