import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:one/apidetail.dart';
import 'package:one/modedetail.dart';

class Detail extends StatelessWidget {
  Detail({this.gambar, this.bahan});

  apidetail _welcome = new apidetail();
  final List<Welcome> liist = List();
  Future<Welcome> welcome;
  final String gambar;
  final String bahan;
  int i;

  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder<Welcome>(
      future: _welcome.getCategories('$bahan'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print(snapshot.data);
        Welcome welcome = snapshot.data;
        if (snapshot.hasData) {
          Meal meal = welcome.meals[0];
          return Scaffold(
            appBar: new AppBar(
              backgroundColor: Colors.blue,
              title: new Text(
                meal.strMeal,
                style:  TextStyle(color: Colors.white),
              ),
            ),
            body:  ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: <Widget>[
                 Container(
                  padding: EdgeInsets.all(10.0),
                  child:  Card(  
                      child:  Hero(
                          tag: bahan ,
                              child:  Image.network(
                                meal.strMealThumb,
                                fit: BoxFit.cover,
                              ),
                              ),
                            ),
                          ),
                 Container(
                  child:  Card(
                      child:  Column(
                    children: <Widget>[
                      Container(
                          child: Padding(
                        padding:  EdgeInsets.all(10.0),
                        child:  Text(
                          meal.strMeal,
                          style:  TextStyle(fontSize: 28.0),
                          textAlign: TextAlign.justify,
                        ),
                      )),
                      Container(
                          width: 350,
                          child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "Cara pembuatan :",
                                style:  TextStyle(
                                  fontSize: 19.0,
                                ),
                                textAlign: TextAlign.start,
                              ))),
                      Container(
                          width: 350,
                          child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                meal.strInstructions,
                                style:  TextStyle(fontSize: 18.0),
                                textAlign: TextAlign.start,
                              ))),
                    ],
                  )),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
              appBar:  AppBar(
                backgroundColor: Colors.blue,
                title:  Text(
                  "Loading",
                  style:  TextStyle(color: Colors.white),
                ),
              ),
              body:Center(  child:  Card(
                      child:  Hero(
                          tag: bahan ,
                              child:  FlutterLogo(size: 100.0,)
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  )
                );
              }
            }
