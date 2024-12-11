class CarObject {
  late String id;
  late String userId;
  late DateTime createdAt, updatedAt, lastEmergency;

  CarObject(String givenId, String givenUserID, DateTime givenCreatedAt, DateTime givenUpdatedAt, DateTime givenLastEmergency) {
    id = givenId;
    userId = givenUserID;
    createdAt = givenCreatedAt;
    updatedAt = givenUpdatedAt;
    lastEmergency = givenLastEmergency; 
  }
}
