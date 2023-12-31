// Internal Modules
import 'package:challenge_for_t_pop/model/seating_response.dart';
import 'package:challenge_for_t_pop/network/network.dart';

// External Modules
import 'package:dio/dio.dart';

class SeatingRepository extends BaseRepository {
  final String _requestSeating = 'seating.json';

  Future<SeatingResponse> requestSeating() async {
    Response<dynamic> response = await dataProvider.get(_requestSeating);

    return SeatingResponse.fromJson(response.data);
  }
}
