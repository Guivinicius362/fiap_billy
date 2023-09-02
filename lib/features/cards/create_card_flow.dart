import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CartoesCredito(),
    );
  }
}

class CartoesCredito extends StatefulWidget {
  @override
  _CartoesCreditoState createState() => _CartoesCreditoState();
}

class _CartoesCreditoState extends State<CartoesCredito> {
  List<String> bancosCartaoCredito = [
    'Banco A',
    'Banco B',
    'Banco C',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Selecione um banco para buscar os cartões de crédito disponíveis:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bancosCartaoCredito.length,
              itemBuilder: (context, index) {
                final banco = bancosCartaoCredito[index];
                return ListTile(
                  title: Text(banco),
                  onTap: () {
                    // Ao tocar em um banco, navegar para a tela de importação de cartões
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImportacaoCartoes(banco: banco),
                      ),
                    );
                  },
                  trailing: Icon(Icons.arrow_right),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ImportacaoCartoes extends StatelessWidget {
  final String banco;

  ImportacaoCartoes({required this.banco});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              'Confirmação de Importação de Cartões',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Deseja importar os dados dos cartões de $banco?',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Text(
              'Importante: Ao prosseguir com a importação, você concorda com os seguintes termos de privacidade de dados de acordo com a LGPD:',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 10.0),
            Text(
              '1. Seus dados serão tratados com a máxima confidencialidade.',
              style: TextStyle(fontSize: 14.0),
            ),
            Text(
              '2. Usaremos suas informações apenas para fins de análise financeira e recomendações personalizadas.',
              style: TextStyle(fontSize: 14.0),
            ),
            Text(
              '3. Você tem o direito de solicitar a exclusão de seus dados a qualquer momento.',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implemente a lógica de importação de cartões aqui
                // Após a importação, navegue de volta para a tela de seleção de banco
                Navigator.pop(context);
              },
              child: Text('Importar Cartões'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartoesImportados extends StatefulWidget {
  final String banco;

  CartoesImportados({required this.banco});

  @override
  _CartoesImportadosState createState() => _CartoesImportadosState();
}

class _CartoesImportadosState extends State<CartoesImportados> {
  List<String> cartoesImportados = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cartões de Crédito - ${widget.banco}'),
      ),
      body: ListView.builder(
        itemCount: cartoesImportados.length,
        itemBuilder: (context, index) {
          final cartao = cartoesImportados[index];
          return ListTile(
            title: Text(cartao),
            // Adicione aqui a lógica para adicionar o cartão quando for clicado
            onTap: () {
              // Exemplo de lógica: cartoesImportados.add(cartao);
              setState(() {
                cartoesImportados.add(cartao);
              });
            },
          );
        },
      ),
    );
  }
}
