import 'package:flutter/material.dart';
import './breakfast.dart' as breakfast;
import './Launch.dart' as dessert;
import 'package:flutter/foundation.dart';

void main() {
  runApp(new myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController c;

  @override
  void initState() {
    c = new TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: new AppBar(
          backgroundColor: Colors.blue,
          title: new Text(
            "List Makanan",
            style: new TextStyle(color: Colors.white),
          ),
          bottom: new TabBar(
            controller: c,
            tabs: <Widget>[
              new Tab(
                icon: new Icon(Icons.room_service),
                text: "Seafood",
              ),
              new Tab(
                icon: new Icon(Icons.fastfood),
                text: "Dessert",
              )
            ],
          ),
        ),
        body: new TabBarView(
          controller: c,
          children: <Widget>[
            new breakfast.breakfast(),

            new dessert.Dessert(),
          ],
        ));
  }
}
