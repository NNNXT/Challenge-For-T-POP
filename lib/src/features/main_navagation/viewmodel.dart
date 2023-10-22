// Flutter Modules
import 'package:flutter/material.dart';

// Internal Modules
import 'package:challenge_for_t_pop/base/base_widget.dart';
import 'package:challenge_for_t_pop/model/seat.dart';
import 'package:challenge_for_t_pop/model/seating.dart';
import 'package:challenge_for_t_pop/model/seating_response.dart';
import 'package:challenge_for_t_pop/network/repository/seating.dart';

class MainNavigationViewModel extends ChangeNotifier {
  final SeatingRepository _seatingRepository;

  // TODO: Change the maximum seat value that the user can select.
  final int _userCanSelect = 5;
  Seating? _seating;

  Seating? get seating => _seating;
  int get userCanSelect => _userCanSelect;

  Future<void> fetchSeating() async {
    SeatingResponse response = await _seatingRepository.requestSeating();
    _seating = response.result;
    notifyListeners();
  }

  void selectSeat({required int index}) {
    SeatStatus? seatStatus = _seating?.seatLayout.seats[index].status;
    if (seatStatus == SeatStatus.available) {
      _seating?.seatLayout.seats[index].status = SeatStatus.book;
    } else {
      _seating?.seatLayout.seats[index].status = SeatStatus.available;
    }
    notifyListeners();
  }

  MainNavigationViewModel({
    required BuildContext context,
  }) : _seatingRepository = context.provide();
}
