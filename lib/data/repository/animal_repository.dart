import 'package:dio/dio.dart';
import 'package:flutter_hm2/data/models/cat_model.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class AnimalRepository {
  AnimalRepository() {
    _dio.interceptors.add(TalkerDioLogger());
  }

  final Dio _dio = Dio();

  Future<String> getCatImage() async {
    final Response response =
        await _dio.get('https://api.thecatapi.com/v1/images/search');
    return response.data.first['url'];
  }

  Future<List<CatModel>> getCats() async {
    final Response response = await _dio.get(
      'https://api.thecatapi.com/v1/images/search?limit=10',
    );
    final List<dynamic> listJson = response.data;
    return listJson.map((json) => CatModel.fromJson(json)).toList();
  }
}