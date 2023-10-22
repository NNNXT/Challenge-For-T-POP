// Internal Modules
import 'package:challenge_for_t_pop/model/seating.dart';

class SeatingResponse {
  final Seating? result;

  SeatingResponse({
    this.result,
  });

  factory SeatingResponse.fromJson(json) => SeatingResponse(
        result: Seating.fromJson(json as Map<String, dynamic>? ?? {}),
      );
}
