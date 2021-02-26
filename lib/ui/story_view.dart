import 'package:flutter/material.dart';
import 'package:new_app/DataLayer/News.dart';
import 'file:///C:/Users/Rania%20Nabil/AndroidStudioProjects/new_app/lib/DataLayer/NewsClient.dart';
import 'package:new_app/ui/story_view_desgin.dart';

class StoryView extends StatefulWidget {
  final String categoryOfStory;
  final String categoryOfStoryImage;
  final String categoryOfStoryName;
  StoryView(
      {this.categoryOfStory,
      this.categoryOfStoryImage,
      this.categoryOfStoryName});
  @override
  _StoryViewState createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView>
    with SingleTickerProviderStateMixin {
  News news = new News();
  bool isDataLoadedimage = false;
  PageController pageController;
  AnimationController animationController;
  var currentIndex;

  @override
  void initState() {
    getJsonData();
    pageController = PageController();
    animationController = AnimationController(vsync: this);
  }

  void getJsonData() async {
    final result = await NewsClient().getNews(widget.categoryOfStory);
    setState(() {
      news = result;
      isDataLoadedimage = true;
    });
  }

  double percent = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        //physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, currentIndex) => isDataLoadedimage
            ? GestureDetector(
                child: StoryViewDesign(
                    news.articles[currentIndex].urlToImage,
                    news.articles[currentIndex].title,
                    widget.categoryOfStoryName,
                    widget.categoryOfStoryImage),
              )
            : Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              )),
      ),
    );
  }
}
