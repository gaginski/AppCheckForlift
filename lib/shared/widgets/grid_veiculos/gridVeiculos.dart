import 'package:flutter/material.dart';

class gridVeiculos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Lista em um Grid';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          // Cria um grid com duas colunas
          crossAxisCount: 2,
          // Gera 100 Widgets que exibem o seu índice
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline,
              ),
            );
          }),
        ),
      ),
    );
  }
}
