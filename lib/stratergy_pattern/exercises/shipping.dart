import 'package:design_pattern/stratergy_pattern/exercises/shipping_cost_calc.dart';

/// Shipping address
///
class Address {
  late String contactName;
  late String address;

  Address(String name, String addr) {
    contactName = name;
    address = addr;
  }
}

/// Shippers you can choose from
///
enum ShippingOptions { ups, fedex, purulator, amazon }

/// Order entity
///
class Order {
  late ShippingOptions _shippingMethod;
  late Address _destination;
  late Address _origin;

  Order(ShippingOptions shippingMethod, Address destination, Address origin) {
    _shippingMethod = shippingMethod;
    _destination = destination;
    _origin = origin;
  }

  ShippingOptions get shippingMethod {
    return _shippingMethod;
  }

  Address get origin {
    return _origin;
  }

  Address get destination {
    return _destination;
  }
}

/// Shipping cost calculation service
///
class ShippingCostCalculatorService {
  static double calculateShippingCost(Order order) {
    switch (order.shippingMethod) {
      case ShippingOptions.fedex:
        return ShippingCostCalcForFedEx().calculateShippingCost(order);

      case ShippingOptions.ups:
        return ShippingCostCalcForUPS().calculateShippingCost(order);

      case ShippingOptions.purulator:
        return ShippingCostCalcForPurulator().calculateShippingCost(order);

      case ShippingOptions.amazon:
        return ShippingCostCalcForAmazon().calculateShippingCost(order);

      default:
        throw Exception("Unknown carrier");
    }
  }
}
