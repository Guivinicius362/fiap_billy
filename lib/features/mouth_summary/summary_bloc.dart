import 'dart:async';
import 'dart:convert';

import 'package:billy/features/mouth_summary/summary.dart';
import 'package:billy/shared/custom_http_client.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

final _getIt = GetIt.instance;

class SummaryBloc {
  final client = _getIt<CustomHttpClient>();

  BehaviorSubject<Summary> _summarySubject = BehaviorSubject<Summary>();

  Stream<Summary> get summaryStream => _summarySubject.stream;

  void fetchSummary() => client.get(url: 'summary').then(
        (response) => _summarySubject.add(
          Summary.fromJson(
            jsonDecode(response.body),
          ),
        ),
      );

  void dispose() {
    _summarySubject.close();
  }
}
