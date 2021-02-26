import 'package:flutter/material.dart';
import 'package:new_app/ui/first_screen.dart';
import 'constant.dart';

class AllApps extends StatefulWidget {
  @override
  _AllAppsState createState() => _AllAppsState();
}

class _AllAppsState extends State<AllApps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topics'),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: kNewsItems.length - 1,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/${kNewsItemsImage[index + 1]}.jpg'),
                        radius: 30.0,
                      ),
                      title: Text(
                        '${kNewsItems[index + 1]}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context, kNewsItemsSelected[index + 1]);
                      });
                    },
                  ),
                )),
      ),
    );
  }
}
