import '../../helper/GeneralHelper.dart';
import 'package:http/http.dart';
import 'dart:convert';

class CheckLoginResponse {
  String? token; 
  String? username;
  String? id;

  CheckLoginResponse(Response response) {
    try {
      final data = jsonDecode(response.body);
      token = data["token"];
      username = data["username"];
      id = data["id"];
    } catch (_) {
      General.makeSnackBar("Could not read response from api");
    }
  }
}