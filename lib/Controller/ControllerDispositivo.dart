import 'package:CheckForklift/Class/Dispositivo.dart';
import 'package:http/http.dart' as http;

class ControllerDispositivo {
  static ControllerDispositivo instance = new ControllerDispositivo();

  Future<bool> cadastrarNew(String urlClient) async {
    try {
      var url = Uri.parse(urlClient + '/api/dispositivos/Cadastrar');

      var response = await http.post(url, body: {
        'imei': '123456789123456',
        'modelo': 'hbjsbh',
        'descricao': 'vitorlindo'
      });
      print(response.body);
      var resp = new RespCadDispositivo();
      resp.jsonToClass(response.body.toString());

      if (resp.id != 0) {
        return true;
      }
      return false;
    } catch (ex) {
      return false;
    }
  }
}
