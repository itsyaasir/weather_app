//import 'dart:convert';
//import 'package:http/http.dart' as http;
//
//class NetworkHelper {
//  NetworkHelper(this.url);
//  final String url;
//  Future getData() async {
//    try {
//      http.Response response = await http.get(url);
//      if (response.statusCode == 200) {
//        dynamic data = response.body;
//        return jsonDecode(data);
//      } else {
//        print(response.statusCode);
//      }
//    } catch (e) {
//      print(e);
//    }
//  }
//}
