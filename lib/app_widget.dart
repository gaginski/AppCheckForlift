import 'package:CheckForklift/shared/themes/appcolors.dart';
import 'package:flutter/material.dart';
import 'modules/login_page.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CHECK FORKLIFT',
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      home: LoginPage(),
    );
  }
}
