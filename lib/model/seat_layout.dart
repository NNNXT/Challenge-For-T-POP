// External Modules
import 'package:challenge_for_t_pop/model/seat.dart';

// Internal Modules
import 'package:json_annotation/json_annotation.dart';

part 'seat_layout.g.dart';

@JsonSerializable(createToJson: false)
class SeatLayout {
  @JsonKey(defaultValue: 0)
  int rows;

  @JsonKey(defaultValue: 0)
  int columns;

  @JsonKey(defaultValue: [])
  List<Seat> seats;

  SeatLayout({
    required this.rows,
    required this.columns,
    required this.seats,
  });

  factory SeatLayout.fromJson(Map<String, dynamic> json) => _$SeatLayoutFromJson(json);
}
