class CarObject {
  late String id, userId;
  late DateTime createdAt, updatedAt, lastEmergency;

  CarObject(String id, String userID, DateTime createdAt, DateTime updatedAt, DateTime lastEmergency) {
    id = this.id;
    userID = this.userID;
    createdAt = this.createdAt;
    updatedAt = this.updatedAt;
    lastEmergency = this.lastEmergency; 
  }
}
