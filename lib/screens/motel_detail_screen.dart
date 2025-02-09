
import 'package:flutter/material.dart';
import 'package:meu_guia/models/motel/motel_model.dart';
import 'package:meu_guia/widgets/suite_card.dart';
class MotelDetailScreen extends StatelessWidget {
  final Motel motel;

  MotelDetailScreen({required this.motel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(motel.fantasia)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(motel.logo, height: 100),
            SizedBox(height: 10),
            Text('Bairro: ${motel.bairro}'),
            Text('Distância: ${motel.distancia} km'),
            SizedBox(height: 20),
            Text('Suítes Disponíveis:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: motel.suites.length,
                itemBuilder: (context, index) {
                  return SuiteCard(suite: motel.suites[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
