// External Modules
import 'package:json_annotation/json_annotation.dart';

part 'seat.g.dart';

@JsonSerializable(createToJson: false)
class Seat {
  String seatNumber;
  String status;

  Seat({
    required this.seatNumber,
    required this.status,
  });

  factory Seat.fromJson(Map<String, dynamic> json) => _$SeatFromJson(json);
}
