import 'dart:collection';

class Veiculos {
  String msg = "";
  List<ListaVeiculos> listaVeiculos = [];
  Veiculos({msg, listaVeiculos});

  fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['listaVeiculos'] != null) {
      json['listaVeiculos'].forEach((v) {
        if (!v.toString().isEmpty)
          listaVeiculos.add(new ListaVeiculos().fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.listaVeiculos.isNotEmpty) {
      data['listaVeiculos'] = this.listaVeiculos.map((v) => v.toJson());
    }
    return data;
  }
}

class ListaVeiculos {
  int id = 0;
  String placa = "";
  String marca = "";
  String cor = "";
  String anoFabricacao = "";
  int status = 0;
  int situacao = 0;

  ListaVeiculos({id, placa, marca, cor, anoFabricacao, status, situacao});

  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    placa = json['placa'];
    cor = json['cor'];
    marca = json["marca"];
    anoFabricacao = json['anoFabricacao'];
    status = json['status'];
    situacao = json['situacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['placa'] = this.placa;
    data['cor'] = this.cor;
    data['anoFabricacao'] = this.anoFabricacao;
    data['status'] = this.status;
    data['situacao'] = this.situacao;
    return data;
  }
}
