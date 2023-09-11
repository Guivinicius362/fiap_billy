import 'dart:convert';

import 'package:billy/features/bank/bank.dart';
import 'package:billy/shared/custom_http_client.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

final _getIt = GetIt.instance;

class BankBloc {
  final client = _getIt<CustomHttpClient>();

  final _selectedBankSubject = BehaviorSubject<Bank>();
  Stream<Bank> get selectedBankStream => _selectedBankSubject.stream;

  final _bankSubject = BehaviorSubject<List<Bank>>();
  Stream<List<Bank>> get bankStream => _bankSubject.stream;

  void selectBank(Bank bank) => _selectedBankSubject.add(bank);

  void fetchBanks() => client.get(url: 'banks').then(
        (response) {
          final body = jsonDecode(response.body) as List<dynamic>;
          final banks = body.map((e) => Bank.fromJson(e)).toList();
          _bankSubject.add(banks);
          _selectedBankSubject.add(banks.first);
        },
      );

  void dispose() {
    _bankSubject.close();
    _selectedBankSubject.close();
  }
}
