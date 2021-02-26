import 'package:flutter/material.dart';
import 'package:new_app/DataLayer/News.dart';
import 'file:///C:/Users/Rania%20Nabil/AndroidStudioProjects/new_app/lib/DataLayer/NewsClient.dart';
import 'package:new_app/ui/news_detials.dart';
import 'news_item_design.dart';

class CategoryScreen extends StatefulWidget {
  final String category;
  CategoryScreen(this.category);
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool isDataLoaded = false;
  News news = new News();

  @override
  void initState() {
    getJsonData();
  }

  void getJsonData() async {
    final result = await NewsClient().getNews(widget.category);
    setState(() {
      news = result;
      isDataLoaded = true;
      print(widget.category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isDataLoaded
          ? ListView.builder(
              itemCount:
                  news.articles.length == null ? 0 : news.articles.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return NewsDetails(
                          imageOfNews: news.articles[index].urlToImage,
                          titleOfNews: news.articles[index].title,
                          descriptionOfNews: news.articles[index].description);
                    }),
                  );
                },
                child: NewsItem(news.articles[index].urlToImage,
                    news.articles[index].title),
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
    );
  }
}
