import 'package:dio/dio.dart';

class PictureService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchPictures({int limit = 20, int page = 1}) async {
    final response = await _dio.get(
        'https://picsum.photos/v2/list',
        queryParameters: {'limit': limit, 'page': page});
    return response.data;
  }

  Future<Map<String, dynamic>> fetchPictureDetail(int id) async {
    try {
      final response = await _dio.get('https://picsum.photos/id/$id/info');
      return response.data;
    } catch (e) {
      throw Exception("Failed to fetch picture detail");
    }
  }
}
