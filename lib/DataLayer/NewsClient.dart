import 'package:http/http.dart' as http;
import 'package:new_app/DataLayer/News.dart';
import 'dart:convert';

//import 'package:new_app/model/News.dart';

//top-headlines?country=us&category=business
class NewsClient {
  Future<News> getNews(String type) async {
    final String url =
        'http://newsapi.org/v2/$type&apiKey=530d6d29e05846ae9390f60b9a286be9';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return News.fromJson(json);
    } else
      throw Exception("error");
  }

  Future<List<A>> getNewsArticles(String type) async {
    final results = await getNews(type);
    final result = results['articles'];
  }
}
