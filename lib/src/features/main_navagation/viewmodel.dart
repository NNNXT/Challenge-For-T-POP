// Flutter Modules
import 'package:flutter/material.dart';

// Internal Modules
import 'package:challenge_for_t_pop/base/base_widget.dart';
import 'package:challenge_for_t_pop/model/seating.dart';
import 'package:challenge_for_t_pop/network/repository/seating.dart';

class MainNavigationViewModel extends ChangeNotifier {
  final SeatingRepository _seatingRepository;
  Seating? _seating;

  Seating? get seating => _seating;

  Future<void> fetchSeating() async {
    var response = await _seatingRepository.requestTaskList();
    _seating = response.result;
    notifyListeners();
  }

  MainNavigationViewModel({
    required BuildContext context,
  }) : _seatingRepository = context.provide();
}
