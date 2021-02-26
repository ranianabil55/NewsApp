import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  String image;
  String title;
  NewsItem(this.image, this.title);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 18.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Image(
            image: NetworkImage("$image"),
            fit: BoxFit.fill,
            //height: 200.0,
          ),
        ),
        Container(
          //height: 60,
          child: Card(
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "$title",
                maxLines: 20,
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
