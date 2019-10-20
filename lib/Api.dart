import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:one/Meal.dart';
class Api {
    String urlrequest =
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood';
    Future<Welcome> getCategories(http.Client client) async {
      try {

        final response = await http.get('$urlrequest');
        if (response.statusCode == 200)
          return welcomeFromJson(response.body);
        else
          throw Exception("tetot");
      }finally{
        client.close();
      }
    }
  }

