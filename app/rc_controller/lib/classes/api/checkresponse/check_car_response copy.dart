import 'package:rc_controller/classes/api/objects/car.dart';
import '../../helper/GeneralHelper.dart';
import 'package:xml2json/xml2json.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '/main.dart';

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