import 'dart:convert';

class RespAutDispositivo {
  int id = 0;
  String imei = "";
  String msg = "";
  String status = '';

  RespAutDispositivo({id, imei, msg, status});

  void jsonToClass(dynamic json) {
    Map<String, dynamic> dispAux = jsonDecode(json);

    this.id = int.parse(dispAux['id'].toString());
    this.imei = dispAux['imei'].toString();
    this.msg = dispAux['msg'].toString();
    this.status = dispAux['status'].toString();
  }
}

class RespCadDispositivo {
  int id = 0;
  String imei = '';
  String msg = '';

  RespCadDispositivo({id, imei, msg, status});

  jsonToClass(dynamic json) {
    Map<String, dynamic> dispAux = jsonDecode(json);

    this.id = dispAux['id'];
    this.imei = dispAux['imei'].toString();
    this.msg = dispAux['msg'].toString();
  }
}

class Dispositivos {
  int id = 0;
  String imei = "";
  String msg = "";
  String status = '';

  void MapToClass(dynamic value) {
    Map<String, dynamic> dispAux = jsonDecode(value);

    this.id = int.parse(dispAux['id'].toString());
    this.imei = dispAux['imei'].toString();
    this.msg = dispAux['msg'].toString();
    this.status = dispAux['status'].toString();
  }

  void ClassToMap(Dispositivos value) {
    Map<String, dynamic> dispAux = new Map();

    dispAux['id'] = this.id;
    dispAux['imei'] = this.imei;
    dispAux['msg'] = this.msg;
    dispAux['status'] = this.status;
  }
}
