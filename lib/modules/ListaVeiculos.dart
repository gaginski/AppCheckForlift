import 'dart:js_util';

import 'package:CheckForklift/Class/Veiculo.dart';
import 'package:CheckForklift/Controller/ControllerVeiculos.dart';
import 'package:CheckForklift/modules/utilizacao.dart';
import 'package:CheckForklift/shared/themes/app_text_styles.dart';
import 'package:CheckForklift/shared/themes/appcolors.dart';
import 'package:flutter/material.dart';

class ListagemVeiculos extends StatefulWidget {
  const ListagemVeiculos({Key? key}) : super(key: key);

  @override
  _ListagemVeiculos createState() => _ListagemVeiculos();
}

Future<Veiculos> retornaRegistros() {
  return ControllerVeiculos.instancia.RetornaVeiculos();
}

class _ListagemVeiculos extends State<ListagemVeiculos> {
  Future<Veiculos> returnItensList() {
    var listaRegistros = retornaRegistros();
    return listaRegistros;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Listagem de Veículos",
            style: AppTextStyles.captionShape,
          ),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.background,
        ),
        body: new FutureBuilder<Veiculos>(
            future: returnItensList(),
            builder: (context, AsyncSnapshot<Veiculos> list) {
              Veiculos child = new Veiculos();
              List<Widget> lista = [];
              if (list.hasData) {
                child = list.data!;
                for (int i = 0; i < child.listaVeiculos.length; i++) {
                  lista.add(Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                      alignment: Alignment.center,
                      child: Positioned(
                          child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.body,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.car_rental_rounded),
                          title: Row(children: [
                            Container(
                              padding: const EdgeInsets.only(right: 120),
                              child: Text(
                                  /*child.listaVeiculos[i].marca,*/ 'Opala LS',
                                  style: AppTextStyles.robotoCondensedEscuro),
                              alignment: Alignment.centerLeft,
                            ),
                            Container(
                              child: Text(
                                /* child.listaVeiculos[i].situacao == 1*/ i %
                                            2 ==
                                        0
                                    ? "Disponível"
                                    : "Indisponível",
                                style: TextStyle(
                                    color: /*child.listaVeiculos[i].situacao == 1*/ i %
                                                2 ==
                                            0
                                        ? Colors.green
                                        : Colors.red),
                              ),
                              alignment: Alignment.centerRight,
                            )
                          ]),
                          subtitle: Text(
                            /*child.listaVeiculos[i].anoFabricacao*/ '1984',
                            style: AppTextStyles.robotoCondensedGrey,
                          ),
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CadUtilizacao())),
                            setRegistro(child.listaVeiculos[i])
                          },
                        ),
                      ))));
                }
              }
              return ListView(children: lista);
            }));
  }
}
