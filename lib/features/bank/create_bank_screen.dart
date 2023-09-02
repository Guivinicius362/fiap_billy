import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VinculacaoContasBancarias(),
    );
  }
}

class VinculacaoContasBancarias extends StatefulWidget {
  @override
  _VinculacaoContasBancariasState createState() =>
      _VinculacaoContasBancariasState();
}

class _VinculacaoContasBancariasState extends State<VinculacaoContasBancarias> {
  String cpf = '';
  String selectedBank = 'Banco A'; // Valor inicial padrão

  List<String> availableBanks = ['Banco A', 'Banco B', 'Banco C', 'Banco D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vinculação de Contas Bancárias'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  cpf = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'CPF',
                hintText: '123.456.789-00',
              ),
            ),
            SizedBox(height: 20.0),
            DropdownButtonFormField<String>(
              value: selectedBank,
              onChanged: (value) {
                setState(() {
                  selectedBank = value!;
                });
              },
              items: availableBanks.map((bank) {
                return DropdownMenuItem<String>(
                  value: bank,
                  child: Text(bank),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Selecione o Banco',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'O que faremos com suas informações:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Ao fornecer suas informações bancárias e dados financeiros, '
              'você nos permite melhorar sua vida financeira de diversas maneiras:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0),
            ),
            Text(
              '1. Analisaremos seus gastos e ganhos para identificar oportunidades de economia e investimento.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0),
            ),
            Text(
              '2. Personalizaremos recomendações financeiras com base em seu perfil financeiro único.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0),
            ),
            Text(
              '3. Ajudaremos você a tomar decisões financeiras mais informadas e estratégicas.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implemente a lógica de vinculação aqui
                print('CPF: $cpf');
                print('Banco Selecionado: $selectedBank');
                // Você pode adicionar a lógica de envio dos dados para a API aqui
              },
              child: Text('Vincular Conta Bancária'),
            ),
          ],
        ),
      ),
    );
  }
}
