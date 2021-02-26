import 'package:flutter/material.dart';
import 'package:new_app/ui/AllApps.dart';
import 'package:new_app/ui/first_screen.dart';
import 'package:new_app/ui/splash_screen.dart';
import 'package:new_app/ui/story_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Newws App',
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF8C1F0F),
        accentColor: Color(0xFF8C1F0F),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        'first': (context) => FirstScreen(),
        'allapp': (context) => AllApps(),
        'storyview': (context) => StoryView(),
      },
    );
  }
}
