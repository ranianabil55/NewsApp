//this class will work with news Client
import 'dart:async';

import 'package:new_app/Bloc/bloc.dart';
import 'package:new_app/DataLayer/News.dart';
import 'package:new_app/DataLayer/NewsClient.dart';

class NewsWorkBloc implements Bloc {
  final controller = StreamController<List<News>>();
  final client = NewsClient();
  Stream<List<News>> get newsStream => controller.stream;

  void submitNews(String type) async {
    final results = await client.getNews(type);
    controller.sink.add(results);
  }

  @override
  void dispose() {}
}
