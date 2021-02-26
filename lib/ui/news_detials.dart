import 'package:flutter/material.dart';
import 'package:new_app/DataLayer/saved_news_data.dart';
//import 'package:new_app/model/saved_news_data.dart';
import 'package:new_app/ui/savedNews.dart';

class NewsDetails extends StatefulWidget {
  final String imageOfNews;
  final String titleOfNews;
  final String descriptionOfNews;
  NewsDetails({
    this.imageOfNews,
    this.titleOfNews,
    this.descriptionOfNews,
  });
  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  SavedNewData data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.brown[50],
      appBar: AppBar(
        leading: GestureDetector(
            child: Icon(
              Icons.save_alt,
            ),
            onTap: () {}),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.black26,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Text(
                    "${widget.titleOfNews}",
                    maxLines: 20,
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF8C1F0F),
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 300.0,
              child: Image(
                image: AssetImage('${widget.imageOfNews}'),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              child: Text('${widget.descriptionOfNews}'),
            ),
          ],
        ),
      ),
    );
  }
}
