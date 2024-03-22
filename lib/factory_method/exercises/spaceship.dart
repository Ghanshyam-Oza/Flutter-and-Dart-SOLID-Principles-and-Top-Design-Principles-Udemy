abstract class SpaceShip {
  String displayName;
  double position;
  double size;
  double speed;

  SpaceShip(this.displayName, this.position, this.size, this.speed);

  void move(double distance) {
    position += distance * speed;
    print('$displayName moved to position $position');
  }
}

class MilleniumFalcon extends SpaceShip {
  MilleniumFalcon(double position, double size, double speed)
      : super("Millenium Falcon", position, size, speed);
}

class UNSCInfinity extends SpaceShip {
  UNSCInfinity(double position, double size, double speed)
      : super("UNSC Infinity", position, size, speed);
}

class USSEnterprise extends SpaceShip {
  USSEnterprise(double position, double size, double speed)
      : super("USS Enterprise", position, size, speed);
}

class Serenity extends SpaceShip {
  Serenity(double position, double size, double speed)
      : super("Serenity", position, size, speed);
}

class SpaceShipFactory {
  static SpaceShip createSpaceShip(String shipType,
      {double position = 0, double size = 10, double speed = 1}) {
    switch (shipType) {
      case "MilleniumFalcon":
        return MilleniumFalcon(position, size, speed);
      case "UNSCInfinity":
        return UNSCInfinity(position, size, speed);
      case "USSEnterprise":
        return USSEnterprise(position, size, speed);
      case "Serenity":
        return Serenity(position, size, speed);
      default:
        throw Exception("Unknown spaceship type: $shipType");
    }
  }
}

void main() {
  // Creating instances of different spaceships using the factory method
  SpaceShip falcon = SpaceShipFactory.createSpaceShip("MilleniumFalcon");
  SpaceShip infinity = SpaceShipFactory.createSpaceShip("UNSCInfinity");
  SpaceShip enterprise = SpaceShipFactory.createSpaceShip("USSEnterprise");
  SpaceShip serenity = SpaceShipFactory.createSpaceShip("Serenity");

  // Moving the spaceships
  falcon.move(10);
  infinity.move(20);
  enterprise.move(30);
  serenity.move(15);
}
