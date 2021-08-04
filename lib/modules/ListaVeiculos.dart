import 'package:CheckForklift/modules/utilizacao.dart';
import 'package:CheckForklift/shared/themes/app_text_styles.dart';
import 'package:CheckForklift/shared/themes/appcolors.dart';
import 'package:flutter/material.dart';

class ListagemVeiculos extends StatefulWidget {
  const ListagemVeiculos({Key? key}) : super(key: key);

  @override
  _ListagemVeiculos createState() => _ListagemVeiculos();
}

class _ListagemVeiculos extends State<ListagemVeiculos> {
  List<Widget> returnItensList() {
    var lista = <Widget>[];

    for (int i = 0; i < 100; i++) {
      bool disponivel = false;
      if (i % 2 == 0) {
        disponivel = true;
        if (i % 3 == 0) {
          disponivel = false;
        }
      }

      lista.add(Container(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
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
                  child: Text('Opalão dela',
                      style: AppTextStyles.robotoCondensedEscuro),
                  alignment: Alignment.centerLeft,
                ),
                Container(
                  child: Text(
                    disponivel ? "Disponível" : "Indisponível",
                    style: TextStyle(
                        color: disponivel ? Colors.green : Colors.red),
                  ),
                  alignment: Alignment.centerRight,
                )
              ]),
              subtitle: Text(
                "100.000 KM",
                style: AppTextStyles.robotoCondensedGrey,
              ),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CadUtilizacao()))
              },
            ),
          ))));
    }
    return lista;
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
      body: ListView(children: returnItensList()),
    );
  }
}
