// External Modules
import 'package:json_annotation/json_annotation.dart';

// Internal Modules
import 'package:challenge_for_t_pop/model/seat_layout.dart';
import 'package:challenge_for_t_pop/model/venue.dart';

part 'seating.g.dart';

@JsonSerializable(createToJson: false)
class Seating {
  Venue venue;

  SeatLayout seatLayout;

  Seating({
    required this.venue,
    required this.seatLayout,
  });

  factory Seating.fromJson(Map<String, dynamic> json) => _$SeatingFromJson(json);
}
