import 'dart:convert';

import 'package:CheckForklift/Class/Config.dart';
import 'package:CheckForklift/Controller/DataBaseHelper.dart';
import 'package:CheckForklift/modules/ConfigAcess_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ControllerRest {
  static ControllerRest instance = new ControllerRest();

  bool verificaConexaoToken(String url) {
    bool retorno = false;

    verificaTokenFuture(url).then((value) => retorno = value);

    return retorno;
  }

  Future<bool> verificaTokenFuture(String urlClient) async {
    try {
      var url = Uri.parse(urlClient + '/api/token/verifica');

      var response = await http.post(url, body: {});
      print(response.body);

      if (response.statusCode == 200)
        return true;
      else
        return true;
    } catch (ex) {
      return false;
    }
  }

  bool getToken(String user, String senha, String url) {
    bool retorno = false;

    getTokenFuture(user, senha, url).then((value) => retorno = value);

    return retorno;
  }

  Future<bool> getTokenFuture(String user, String senha, urlClient) async {
    try {
      var url =
          Uri.parse("https://localhost:44369/token" /*urlClient + '/token'*/);
      var controllerDb = new DatabaseHelper();

      var response = await http.post(
        url,
        body: {
          "user": user.toString(),
          "password": senha,
          "grant_type": "password"
        },
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        encoding: convert.Encoding.getByName("utf-8"),
      );
      print(response.body);

      if (response.statusCode == 200) {
        var config = new ClassConfig();

        Map<String, dynamic> dispAux = jsonDecode(response.body);

        config.id = 0;
        config.urlApi = urlClient;
        config.usuarioLogado = txtUsuario.text;
        config.senhaUsuarioLogado = txtSenha.text;
        config.token = dispAux["access_token"];

        controllerDb.insertConfig(config);

        return true;
      } else
        return true;
    } catch (ex) {
      return false;
    }
  }
}
