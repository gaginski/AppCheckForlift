import 'package:CheckForklift/shared/themes/app_text_styles.dart';
import 'package:CheckForklift/shared/themes/appcolors.dart';
import 'package:flutter/material.dart';

class CadUtilizacao extends StatefulWidget {
  const CadUtilizacao({Key? key}) : super(key: key);

  @override
  _CadUtilizacao createState() => _CadUtilizacao();
}

class _CadUtilizacao extends State<CadUtilizacao> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastro e manutenção de Utilizações do Veículo",
          style: AppTextStyles.captionShape,
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.background,
      ),
      body: Container(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25),
                width: size.width,
                height: size.height / 4,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.body,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      child: Icon(
                        Icons.car_rental_rounded,
                        size: (size.width / 2.5),
                      ),
                      width: size.width / 2.5,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Opala TD",
                                style: AppTextStyles.titleHome,
                              ),
                              Row(children: [
                                Text("Informações:"),
                                Text("45000 kM"),
                              ]),
                            ]))
                  ],
                )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: Column(children: [
                TextFormField(
                  autofocus: true,
                  style: AppTextStyles.captionBody,
                  decoration: InputDecoration(
                      labelText: "KM Inicial",
                      labelStyle: AppTextStyles.buttonGray),
                ),
                TextFormField(
                  autofocus: true,
                  style: AppTextStyles.captionBody,
                  decoration: InputDecoration(
                      labelText: "Observação",
                      labelStyle: AppTextStyles.buttonGray),
                )
              ]),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                    child: ButtonTheme(
                      child: RaisedButton(
                          child: Text(
                            "Solicitar Acesso",
                            style: AppTextStyles.buttonGray,
                          ),
                          color: AppColors.background,
                          onPressed: () => {}),
                    ),
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                      child: ButtonTheme(
                        child: RaisedButton(
                            child: Text(
                              "Solicitar Acesso",
                              style: AppTextStyles.buttonGray,
                            ),
                            color: AppColors.background,
                            onPressed: () => {}),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
