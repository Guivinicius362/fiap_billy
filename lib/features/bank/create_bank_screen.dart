import 'package:billy/features/bank/bank.dart';
import 'package:billy/features/bank/create_bank_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final _getIt = GetIt.instance;

class CreateBankScreen extends StatelessWidget {
  final BankBloc _bankBloc = _getIt<BankBloc>();
  @override
  Widget build(BuildContext context) {
    _bankBloc.fetchBanks();
    return Scaffold(
      appBar: AppBar(
        title: Text('Vinculação de Contas Bancárias'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  labelText: 'CPF',
                  hintText: '123.456.789-00',
                ),
              ),
              SizedBox(height: 20.0),
              StreamBuilder<List<Bank>>(
                  stream: _bankBloc.bankStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    final banks = snapshot.data!;
                    return StreamBuilder<Bank>(
                        stream: _bankBloc.selectedBankStream,
                        builder: (context, snapshot) {
                          return DropdownButtonFormField<String>(
                            value: snapshot.data?.name ?? '',
                            onChanged: (value) {
                              _bankBloc.selectBank(
                                banks.firstWhere(
                                    (element) => element.name == value),
                              );
                            },
                            items: banks.map((bank) {
                              return DropdownMenuItem<String>(
                                value: bank.name,
                                child: Text(bank.name),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              labelText: 'Selecione o Banco',
                            ),
                          );
                        });
                  }),
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
                  Navigator.of(context).pop();
                },
                child: Text('Vincular Conta Bancária'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
