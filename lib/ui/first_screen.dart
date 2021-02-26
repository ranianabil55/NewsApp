import 'package:flutter/material.dart';
import 'file:///C:/Users/Rania%20Nabil/AndroidStudioProjects/new_app/lib/DataLayer/NewsClient.dart';
import 'package:new_app/ui/story_view.dart';
import 'categoryscreen.dart';
import 'constant.dart';

Widget newCategorySelected;
String selectCategory;

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool clicked = true;
  void selectAllApp(String categoryName) async {
    if (categoryName == 'All Apps') {
      final selectedCategoryResult =
          await Navigator.pushNamed(context, 'allapp');
      setState(() {
        selectCategory = selectedCategoryResult;
        newCategorySelected = CategoryScreen(selectCategory);
        print('$selectCategory');
        clicked = false;
      });
    } else if (categoryName == 'Bitcoin') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return StoryView(
            categoryOfStory: kNewsItemsSelected[1],
            categoryOfStoryName: kNewsItems[1],
            categoryOfStoryImage: kNewsItemsImage[1]);
      }));
    } else if (categoryName == 'Business') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return StoryView(
            categoryOfStory: kNewsItemsSelected[2],
            categoryOfStoryName: kNewsItems[2],
            categoryOfStoryImage: kNewsItemsImage[2]);
      }));
    } else if (categoryName == 'Technology') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return StoryView(
          categoryOfStory: kNewsItemsSelected[3],
          categoryOfStoryName: kNewsItems[3],
          categoryOfStoryImage: kNewsItemsImage[3],
        );
      }));
    } else if (categoryName == 'Journal') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return StoryView(
            categoryOfStory: kNewsItemsSelected[4],
            categoryOfStoryName: kNewsItems[4],
            categoryOfStoryImage: kNewsItemsImage[4]);
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'News App',
        )),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: kNewsItems.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    SizedBox(
                      // width: 20.0,
                      height: 20.0,
                    ),
                    GestureDetector(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/${kNewsItemsImage[index]}.jpg'),
                        radius: 40.0,
                      ),
                      onTap: () {
                        setState(() {
                          selectAllApp(kNewsItems[index]);
                        });
                      },
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '${kNewsItems[index]}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child:
                // clicked
                //     ? Center(
                //         child: Container(
                //           child: Text('News'),
                //         ),
                //       )
                //     :
                Container(child: newCategorySelected, color: Colors.white),
          )
        ],
      ),
    );
  }
}
