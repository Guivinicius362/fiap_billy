import 'package:billy/features/mouth_summary/summary.dart';
import 'package:billy/features/mouth_summary/summary_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final _getIt = GetIt.instance;

class SummaryScreen extends StatelessWidget {
  final SummaryBloc _summaryBloc = _getIt<SummaryBloc>();

  @override
  Widget build(BuildContext context) {
    _summaryBloc.fetchSummary(); // Inicia a busca dos dados

    return Scaffold(
      appBar: AppBar(
        title: Text('Resumo Financeiro'),
      ),
      body: StreamBuilder<Summary>(
        stream: _summaryBloc.summaryStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao buscar os dados.'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Nenhum dado disponível.'));
          }

          final summary = snapshot.data!;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildSection('Despesas', summary.expenses),
                  _buildSection('Rendas', summary.incomes),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSection(String title, dynamic section) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: section.items.length,
          itemBuilder: (context, index) {
            final item = section.items[index];
            return ListTile(
              leading: Image.network(item.bankImage),
              title: Text(item.bank),
              subtitle: Text('Valor: ${item.value}'),
            );
          },
        ),
        SizedBox(height: 10),
        Text(
          'Total: ${section.total}',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Divider(),
      ],
    );
  }
}
