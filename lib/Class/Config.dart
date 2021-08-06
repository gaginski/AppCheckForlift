import 'dart:convert';

class ClassConfig {
  int id = 0;
  String urlApi = "";
  String token = "";
  String usuarioLogado = "";
  String senhaUsuarioLogado = "";

  ClassConfig MapToClass(dynamic value) {
    Map<String, dynamic> dispAux = jsonDecode(value);

    this.urlApi = dispAux['urlApi'].toString();
    this.id = int.parse(dispAux['id'].toString());
    this.token = dispAux['token'].toString();
    this.usuarioLogado = ['usuarioLogado'].toString();
    this.senhaUsuarioLogado = dispAux['senhaUsuarioLogado'].toString();

    return this;
  }

  Map<String, dynamic> ClassToMap(ClassConfig value) {
    Map<String, dynamic> dispAux = new Map();

    dispAux['urlApi'] = this.urlApi;
    dispAux['id'] = value.id;
    dispAux['token'] = value.token;
    dispAux['usuarioLogado'] = value.usuarioLogado;
    dispAux['senhaUsuarioLogado'] = value.senhaUsuarioLogado;

    return dispAux;
  }
}
