import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class API {
  Future<http.Response> postRequest(String body, String action) async {
    // Production
    String url = 'https://carapi.mercantec.tech/api';
    if (!kReleaseMode) {
      // Test
      url = 'https://carapi.mercantec.tech/api';
    }

    // Create header with action
    final header = {
      'Content-Type': 'application/json',
      'Content-Length': '${body.length}',
      'Accept': 'text/plain',
    };

    // Post the request
    var temp = http.post(
      Uri.parse(url + action),
      headers: header,
      body: body,
    );
    return temp;
  }

  Future<http.Response> getRequest(String action) async {
    // Production
    String url = 'https://carapi.mercantec.tech/api';
    if (!kReleaseMode) {
      // Test
      url = 'https://carapi.mercantec.tech/api';
    }

    // Create header with action
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'text/plain',
    };

    // Post the request
    var temp = http.get(
      Uri.parse(url + action),
      headers: header,
    );
    return temp;
  }
}
