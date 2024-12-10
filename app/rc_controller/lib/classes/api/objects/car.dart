class CarObject {
  late String id, userId;
  late DateTime createdAt, updatedAt, lastEmergency;

  CarObject(String id, String userID, DateTime createdAt, DateTime updatedAt,
      DateTime lastEmergency) {
    id = id;
    userID = userID;
    createdAt = createdAt;
    updatedAt = updatedAt;
    lastEmergency = lastEmergency;
  }
}
