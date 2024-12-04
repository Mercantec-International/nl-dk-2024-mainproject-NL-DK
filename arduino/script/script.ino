#include "HyperDriveCar.h"

HyperDriveCar hyperDriveCar;


void setup() {
  hyperDriveCar.begin();
}

void loop() {
  hyperDriveCar.handleData();
}

