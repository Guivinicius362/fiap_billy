import 'package:flutter/material.dart';

class BancosVinculados extends StatefulWidget {
  @override
  _BancosVinculadosState createState() => _BancosVinculadosState();
}

class _BancosVinculadosState extends State<BancosVinculados> {
  List<Map<String, String>> bancosVinculados = [
    {'banco': 'Banco Destaque', 'conta': '**** **** **** 1234'},
    {'banco': 'Banco ABC', 'conta': '**** **** **** 5678'},
    {'banco': 'Banco XYZ', 'conta': '**** **** **** 9012'},
  ]; // Exemplo de bancos vinculados

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bancos Vinculados'),
      ),
      body: ListView.builder(
        itemCount: bancosVinculados.length,
        itemBuilder: (context, index) {
          final banco = bancosVinculados[index];
          return ListTile(
            title: Text(
              banco['banco']!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Cor destacada
              ),
            ),
            subtitle: Text(
              'Conta: ${banco['conta']}',
              style: TextStyle(
                fontSize: 12.0, // Tamanho menor para o número da conta
                color: Colors.black54, // Cor mais suave para o número da conta
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Implemente a lógica de desvinculação aqui
                setState(() {
                  bancosVinculados.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Exclusão de Banco\n\nAo remover um banco, garantimos que todos os seus dados relacionados a esse banco serão tratados de acordo com as diretrizes da LGPD e com total segurança. Seu direito à privacidade é nossa prioridade.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.0),
        ),
      ),
    );
  }
}
