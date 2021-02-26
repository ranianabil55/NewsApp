import 'package:new_app/ui/savedNews.dart';

class SavedNewData {
  List<SavedNews> save = List();
  void addData(String titleOfNews, String imageOfNews) {
    save.add(SavedNews(title: titleOfNews, image: imageOfNews));
  }

  void pri() {
    print(save.length);
    print(save[0].title);
  }
}
