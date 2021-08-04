import 'package:CheckForklift/shared/themes/app_images.dart';
import 'package:CheckForklift/shared/themes/app_text_styles.dart';
import 'package:CheckForklift/shared/themes/appcolors.dart';
import 'package:CheckForklift/shared/widgets/social_login_buttom/buttonSocialLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ConfigAcess_page.dart';
import 'ListaVeiculos.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class _LoginPage extends State<LoginPage> {
  bool anime = false;
  bool animeText = false;
  static const int timeAnime = 1000;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_) {
      setState(() {
        anime = !anime;
      });
    });
    Future.delayed(Duration(seconds: 4)).then((_) {
      setState(() {
        animeText = !animeText;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
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
                  duration: Duration(milliseconds: timeAnime),
                  width: size.width,
                  height: anime ? size.height * 0.40 : size.height,
                  color: AppColors.primary,
                ),
                Column(children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: timeAnime),
                    padding: EdgeInsets.only(
                      left: 0,
                      right: 0,
                      top: anime ? 80 : 300,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            AppImages.logo_empilhadeira,
                            width: 380,
                            height: 280,
                          )
                        ]),
                  ),
                  AnimatedContainer(
                      duration: Duration(milliseconds: timeAnime),
                      child: Positioned(
                          bottom: size.height * 0.15,
                          left: 0,
                          right: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AnimatedContainer(
                                duration: Duration(milliseconds: timeAnime),
                                padding: const EdgeInsets.only(
                                    top: 30, left: 70, right: 70),
                                child: Opacity(
                                  child: Text(
                                    "Registre a utilização de empilhadeiras de forma rápida e prática",
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.titleHome,
                                  ),
                                  opacity: animeText ? 1.0 : 0.0,
                                ),
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: timeAnime),
                                padding: const EdgeInsets.only(
                                    left: 40, right: 40, top: 40),
                                child: Opacity(
                                  child: ButtonConfigurarApi(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ListagemVeiculos()));
                                    },
                                  ),
                                  opacity: animeText ? 1.0 : 0.0,
                                ),
                              )
                            ],
                          )))
                ])
              ],
            )));
  }
}
