import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExclusaoCartoes(),
    );
  }
}

class ExclusaoCartoes extends StatefulWidget {
  @override
  _ExclusaoCartoesState createState() => _ExclusaoCartoesState();
}

class _ExclusaoCartoesState extends State<ExclusaoCartoes> {
  List<String> cartoesImportados = [
    'Cartão 1',
    'Cartão 2',
    'Cartão 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exclusão de Cartões'),
      ),
      body: ListView.builder(
        itemCount: cartoesImportados.length,
        itemBuilder: (context, index) {
          final cartao = cartoesImportados[index];
          return ListTile(
            title: Text(cartao),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Implemente a lógica de exclusão de cartão aqui
                setState(() {
                  cartoesImportados.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Exclusão de Cartão\n\nAo remover um cartão, garantimos que todos os seus dados relacionados a esse cartão serão tratados de acordo com as diretrizes da LGPD e com total segurança. Seu direito à privacidade é nossa prioridade.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.0),
        ),
      ),
    );
  }
}
