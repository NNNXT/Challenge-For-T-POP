// Flutter Modules
import 'package:flutter/material.dart';

// External Modules
import 'package:json_annotation/json_annotation.dart';

part 'seat.g.dart';

enum SeatStatus { available, book, unavailable }

@JsonSerializable(createToJson: false)
class Seat {
  String seatNumber;

  @JsonKey(
    unknownEnumValue: SeatStatus.unavailable,
    defaultValue: SeatStatus.unavailable,
  )
  SeatStatus status;

  Seat({
    required this.seatNumber,
    required this.status,
  });

  factory Seat.fromJson(Map<String, dynamic> json) => _$SeatFromJson(json);
}

extension SeatStatusColor on SeatStatus {
  MaterialColor get toSeatColor {
    switch (this) {
      case SeatStatus.available:
        return Colors.green;

      case SeatStatus.book:
        return Colors.pink;

      default:
        return Colors.grey;
    }
  }
}
