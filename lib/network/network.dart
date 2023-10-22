// External Modules
import 'package:dio/dio.dart';

abstract class BaseRepository {
  late Dio _dio;

  Dio get dataProvider => _dio;

  BaseRepository() {
    String baseUrl = 'https://xokthilat.github.io/json/';
    BaseOptions options = BaseOptions(
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      baseUrl: baseUrl,
    );
    _dio = Dio(options);
  }
}
