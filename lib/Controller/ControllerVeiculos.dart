import 'dart:convert';
import 'package:CheckForklift/Class/Veiculo.dart';
import 'package:CheckForklift/Controller/Instance.dart';
import 'package:http/http.dart' as http;

class ControllerVeiculos {
  static ControllerVeiculos instancia = new ControllerVeiculos();

  Future<Veiculos> RetornaVeiculos() async {
    try {
      var url = Uri.parse(Instancia.atual.url + '/api/veiculo/Buscar');

      var response = await http.post(url,
          body: {'imei': '123456789123456', 'user': Instancia.atual.usuario});
      print(response.body);

      Veiculos veiculos = new Veiculos();
      veiculos.fromJson(jsonDecode(response.body));
      return veiculos;
    } catch (ex) {
      return new Veiculos();
    }
  }
}
