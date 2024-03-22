import 'package:design_pattern/stratergy_pattern/exercises/shipping.dart';

abstract class ShippingCostCalc {
  double calculateShippingCost(Order order);
}

class ShippingCostCalcForFedEx extends ShippingCostCalc {
  @override
  double calculateShippingCost(Order order) {
    return 5.00;
  }
}

class ShippingCostCalcForUPS extends ShippingCostCalc {
  @override
  double calculateShippingCost(Order order) {
    return 7.25;
  }
}

class ShippingCostCalcForPurulator extends ShippingCostCalc {
  @override
  double calculateShippingCost(Order order) {
    return 9.25;
  }
}

class ShippingCostCalcForAmazon extends ShippingCostCalc {
  @override
  double calculateShippingCost(Order order) {
    return 3.25;
  }
}
