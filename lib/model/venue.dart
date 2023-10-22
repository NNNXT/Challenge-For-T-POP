// External Modules
import 'package:json_annotation/json_annotation.dart';

part 'venue.g.dart';

@JsonSerializable(createToJson: false)
class Venue {
  @JsonKey(defaultValue: '')
  String name;

  @JsonKey(defaultValue: 0)
  int capacity;

  Venue({
    required this.name,
    required this.capacity,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);
}
