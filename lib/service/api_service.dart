// ignore_for_file: unused_local_variable

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  // ignore: body_might_complete_normally_nullable
  static Future<Response?> get(String endPoint) async {
    final response = await http.get(Uri.parse(endPoint));
    if (kDebugMode) {
      print(endPoint);
    }
    if (response.statusCode == 200) {
      return response;
    }
  }
}
