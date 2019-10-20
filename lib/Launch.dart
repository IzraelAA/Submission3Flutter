import 'package:flutter/material.dart';
import 'package:one/Meal.dart';
import 'package:http/http.dart' as http;
import 'package:one/apidessert.dart';
import 'package:one/Detail.dart';

class Dessert extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Dessert> {

  final List<Welcome> liist = List();
  Future<Welcome> welcome;
  Api _welcome = Api();
@override
void initState() {
  welcome = _welcome.getCategories(http.Client());
  super.initState();
}

@override
Widget build(BuildContext context) {
  return Scaffold(body: getBody());
}

getBody() {
  return SafeArea(
    child: FutureBuilder(
      initialData: liist,
      future: welcome,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(snapshot.error.toString()),
            ),
          );
          return Center(
            child: Text("Something wronge"),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          Welcome welcome = snapshot.data as Welcome;
          return GridView.builder(
            itemCount: welcome.meals.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                Meal meals = welcome.meals[index];
                return GestureDetector(
                    child: new Card(
                      child: new Column(children: <Widget>[
                        new Hero(
                          tag: meals.idMeal,
                            child: new Material(
                              child:  InkWell(
                                onTap: () => Navigator.of(context)
                                    .push( MaterialPageRoute(
                                  builder: (BuildContext context) =>  Detail(
                                    gambar: meals.strMealThumb,
                                    bahan: meals.idMeal,
                                  ),
                                )),
                                child: new Image.network(
                                  meals.strMealThumb,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                        ),
                      ]),
                    ));
              });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ),
  );
}
}