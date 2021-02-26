import 'dart:ffi';

import 'package:flutter/material.dart';

class StoryViewDesign extends StatelessWidget {
  final String imageOfNews;
  final String titleOfNews;
  final String nameOfCategorySelected;
  final String imageOfCategorySelected;

  StoryViewDesign(this.imageOfNews, this.titleOfNews,
      this.nameOfCategorySelected, this.imageOfCategorySelected);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Image(
                    image: NetworkImage("$imageOfNews"),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Colors.black26,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          "$titleOfNews",
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
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 36.0, horizontal: 8.0),
            child: Column(
              children: [
                LinearProgressIndicator(
                  // value: percent,
                  backgroundColor: Colors.red,
                  //valueColor: Color.(0xFFFFFFFF),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/images/$imageOfCategorySelected.jpg'),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '$nameOfCategorySelected',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
