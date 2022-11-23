import 'package:chuck_norris_jokes/modules/random/models/randon_joke_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _baseUrl = "https://api.chucknorris.io/jokes";
  final String _random = "/random";
  final String _categories = "/categories";
  final String _byCategory = "/random?category=";

  List<RandomJoke> listOfJokes = [];

  Future<List<RandomJoke>> getRandomJoke({int listSize = 10}) async {
    Response res;
    try {
      for (var i = 0; i < listSize; i++) {
        res = await _dio.get(_baseUrl+_random);
        listOfJokes.add(RandomJoke.fromJson(res.data));
      }
      return listOfJokes;
    } catch (e) {
      rethrow ;
    }
  }

  Future getCategories() async {
    Response res;
    try {
      res = await _dio.get(_baseUrl+_categories);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<RandomJoke>> getJokeByCategory({int listSize = 10, String category = "dev"}) async {
    Response res;
    try {
      for (var i = 0; i < listSize; i++) {
        res = await _dio.get(_baseUrl+_byCategory+category);
        listOfJokes.add(RandomJoke.fromJson(res.data));
      }
      return listOfJokes;
    } catch (e) {
      rethrow ;
    }
  }
}