import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:texos/models/trivamodel.dart';

class HttpServices {
  static const String uri = 'https://opentdb.com/api.php?amount=10';
  var client = http.Client();

  Future fetchApi() async {
    try {
      var res = await client.get(Uri.parse(uri));
      if (res.statusCode == 200) {
        var jsonstr = res.body;
        //print(jsonstr);
        return Data.fromJson(jsonDecode(jsonstr));
      } else {
        print('some network error occured');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
