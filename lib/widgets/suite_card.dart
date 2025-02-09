import 'package:flutter/material.dart';
import 'package:meu_guia/models/motel/suite_model.dart';

class SuiteCard extends StatelessWidget {
  final Suite suite;

  SuiteCard({required this.suite});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(suite.nome),
        subtitle: Text('Preço: R\$${suite.periodos.first.valor}'),
      ),
    );
  }
}
