import 'package:rc_controller/classes/api/objects/car.dart';
import '../../helper/GeneralHelper.dart';
import 'package:xml2json/xml2json.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '/main.dart';

class CheckResponse {
  List<CarObject> Cars = [];

  CheckResponse(Response response, String type) {
    try {
      final xml2Json = Xml2Json();
      xml2Json.parse(response.body);
      final data = jsonDecode(xml2Json.toParker());
      final Results = data['s:Envelope']['s:Body']['Check${type}Response']['Check${type}Result'];

      if (Results['a:Cards'] != null) {
        if (Results['a:Cards']['a:Card'].runtimeType == List<dynamic>) {
          final totalCards = Results['a:Cards']['a:Card'];
          for (var element in totalCards) {
            //Cars.add(CarObject(element));
          }
        } else {
          //Cars.add(CarObject(Results['a:Cards']['a:Card']));
        }
      }
    } catch (_) {
      General.makeSnackBar("Could not read response from api");
    }
  }
}