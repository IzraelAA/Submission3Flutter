import 'package:http/http.dart' as http;
import 'package:one/modedetail.dart';

import 'package:one/Detail.dart';

class apidetail {

  String urlrequest = 'https://www.themealdb.com/api/json/v1/1/lookup.php?i=';

  Future<Welcome> getCategories(String id) async {
    String data = '$id';
    final response = await http.get('$urlrequest$data');
    if (response.statusCode == 200)
      return welcomeFromJson(response.body);
    else
      throw Exception("tetot");
  }
}
