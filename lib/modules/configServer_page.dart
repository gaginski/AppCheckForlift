import 'package:CheckForklift/shared/themes/app_images.dart';
import 'package:CheckForklift/shared/themes/app_text_styles.dart';
import 'package:CheckForklift/shared/themes/appcolors.dart';
import 'package:CheckForklift/shared/widgets/social_login_buttom/buttonConfigServidor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> EnviaRequsicao() async {
  var url = Uri.parse('https://localhost:44369/api/usuario/Autenticar');
  var response =
      await http.post(url, body: {'User': 'Vitor', 'Senha': '12346'});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

class ConfigServer_Page extends StatefulWidget {
  @override
  _ConfigServer_Page createState() => _ConfigServer_Page();
}

class _ConfigServer_Page extends State<ConfigServer_Page> {
  static const int timeAnime = 1000;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.background,
        body: AnimatedContainer(
          duration: Duration(milliseconds: timeAnime),
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              AnimatedContainer(
                  duration: Duration(microseconds: timeAnime),
                  color: AppColors.primary,
                  width: size.width,
                  height: size.height / 9,
                  child: AnimatedContainer(
                    padding: EdgeInsets.only(
                      left: 0,
                      top: 10,
                    ),
                    child: Image.asset(
                      AppImages.menu,
                      width: 10,
                      height: 10,
                    ),
                    duration: Duration(milliseconds: timeAnime),
                    width: 10,
                    height: 10,
                  )),
              AnimatedContainer(
                padding: EdgeInsets.only(top: 100, left: 10, right: 10),
                duration: Duration(microseconds: timeAnime),
                child: Column(children: [
                  Text(
                    "URL Api:",
                    textAlign: TextAlign.start,
                    style: AppTextStyles.titleRegular,
                  ),
                  Positioned(
                    child: widgetTextField(),
                    height: size.width - 100,
                  ),
                  Container(
                    width: 100,
                    child: Text(
                      "",
                      textAlign: TextAlign.start,
                      style: AppTextStyles.titleRegular,
                    ),
                  ),
                  Text(
                    "Token:",
                    textAlign: TextAlign.start,
                    style: AppTextStyles.titleRegular,
                  ),
                  Positioned(
                    child: widgetTextField(),
                    height: size.width - 100,
                  ),
                  Expanded(
                    child: Text(""),
                  ),
                  ButtonConfigurarApi(
                    onTap: () {
                      EnviaRequsicao();
                    },
                  ),
                ]),
              )
            ],
          ),
        ));
  }

  widgetTextField() {
    return TextField(
      decoration: InputDecoration(
          border: InputBorder.none, hintText: 'Informe a URL da API'),
    );
  }
}
