import 'package:CheckForklift/Class/Config.dart';
import 'package:CheckForklift/Controller/ControllerDispositivo.dart';
import 'package:CheckForklift/Controller/ControllerRest.dart';
import 'package:CheckForklift/Controller/DataBaseHelper.dart';
import 'package:CheckForklift/Controller/Instance.dart';
import 'package:CheckForklift/modules/login_page.dart';
import 'package:CheckForklift/shared/themes/app_text_styles.dart';
import 'package:CheckForklift/shared/themes/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:CheckForklift/Class/Dispositivo.dart';
import 'package:http/http.dart' as http;

class ConfigAcessPage extends StatefulWidget {
  const ConfigAcessPage({Key? key}) : super(key: key);

  @override
  _ConfigAcessPage createState() => _ConfigAcessPage();
}

var txtUrlApi = TextEditingController();
var txtUsuario = TextEditingController();
var txtSenha = TextEditingController();
Future verificaConexaoApi(String urlClient, BuildContext context) async {
  try {
    var controllerRest = new ControllerRest();

    var url = Uri.parse(urlClient + '/api/dispositivos/Autenticar');

    var response = await http.post(url, body: {'imei': '12345689123456'});
    print(response.body);
    var resp = new RespAutDispositivo();
    resp.jsonToClass(response.body.toString());

    if (resp.status.isNotEmpty && resp.status == '404') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Atenção!"),
          content:
              Text("Dispositivo não cadastrado! Deseja cadastrar o mesmo?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => {
                Navigator.of(context, rootNavigator: true).pop(),
                ControllerDispositivo.instance
                    .cadastrarNew(urlClient)
                    .then((bool v) => concluiCadNewDispositivo(context, v))
              },
              child: Text('Sim'),
            ),
            TextButton(
              onPressed: () =>
                  {Navigator.of(context, rootNavigator: true).pop()},
              child: Text('Não'),
            )
          ],
        ),
      );
    } else {
      var config = new ClassConfig();

      config.id = 1;
      config.urlApi = urlClient;
      config.usuarioLogado = txtUsuario.text;
      config.senhaUsuarioLogado = txtSenha.text;

      var db = new DatabaseHelper();

      db.insertConfig(config);
    }
  } catch (v) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: Text("Atenção!"),
                content: Text("Não foi possivel se conectar na API!"),
                actions: [
                  TextButton(
                    onPressed: () =>
                        {Navigator.of(context, rootNavigator: true).pop()},
                    child: Text('Ok'),
                  )
                ]));
  }
}

concluiCadNewDispositivo(BuildContext context, bool value) {
  if (value) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: Text("Atenção!"),
                content: Text("Criado com sucesso!"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage())),
                    child: Text('Ok'),
                  )
                ]));

    Instancia.atual.senha = txtSenha.text;
    Instancia.atual.url = txtUrlApi.text;
    Instancia.atual.usuario = txtUsuario.text;

    /* var config = new ClassConfig();

    config.id = 1;
    config.urlApi = txtUrlApi.text;
    config.usuarioLogado = txtUsuario.text;
    config.senhaUsuarioLogado = txtSenha.text;

    var db = new DatabaseHelper();

    db.insertConfig(config);*/
  } else {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: Text("Atenção!"),
                content: Text("Não foi possivel criar o dispositivo!"),
                actions: [
                  TextButton(
                    onPressed: () =>
                        {Navigator.of(context, rootNavigator: true).pop()},
                    child: Text('Ok'),
                  )
                ]));
  }
}

class _ConfigAcessPage extends State<ConfigAcessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Configurações do servidor",
            style: AppTextStyles.captionShape,
          ),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.background,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                autofocus: true,
                style: AppTextStyles.captionBody,
                decoration: InputDecoration(
                    labelText: "URL API", labelStyle: AppTextStyles.buttonGray),
                controller: txtUrlApi,
              ),
              TextFormField(
                autofocus: true,
                style: AppTextStyles.captionBody,
                decoration: InputDecoration(
                    labelText: "User", labelStyle: AppTextStyles.buttonGray),
                controller: txtUsuario,
              ),
              TextFormField(
                autofocus: true,
                style: AppTextStyles.captionBody,
                decoration: InputDecoration(
                    labelText: "Key", labelStyle: AppTextStyles.buttonGray),
                controller: txtSenha,
              ),
              ButtonTheme(
                child: RaisedButton(
                    child: Text(
                      "Solicitar Acesso",
                      style: AppTextStyles.buttonGray,
                    ),
                    color: AppColors.background,
                    onPressed: () => {
                          verificaConexaoApi(txtUrlApi.text, context),
                        }),
              )
            ],
          )),
        ));
  }
}
