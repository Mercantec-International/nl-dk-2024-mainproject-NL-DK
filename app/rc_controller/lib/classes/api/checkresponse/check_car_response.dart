import 'package:rc_controller/classes/api/objects/car.dart';
import '../../helper/GeneralHelper.dart';
import 'package:http/http.dart';
import 'dart:convert';

class CheckCarResponse {
  List<CarObject> Cars = [];

  CheckCarResponse(Response response) {
    try {
      final data = jsonDecode(response.body);
      
      
      if (data.runtimeType == List<dynamic>) {
        for (var item in data) {
          mapToCar(item);
        }
      } else {
        mapToCar(data);
      }
    } catch (_) {
      General.makeSnackBar("Could not read response from api");
    }
  }

  void mapToCar(dynamic item) {
    String Id = item["id"]; 
    String UserId = item["userId"];
    DateTime CreatedAt = DateTime.parse(item["createdAt"]); 
    DateTime UpdatedAt = DateTime.parse(item["updatedAt"]); 
    DateTime LastEmergency = DateTime.parse(item["lastEmergency"]);
          
    Cars.add(CarObject(Id, UserId, CreatedAt, UpdatedAt, LastEmergency));
  }
}