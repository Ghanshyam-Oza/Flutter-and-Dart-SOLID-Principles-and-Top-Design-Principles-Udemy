import 'package:design_pattern/stratergy_pattern/exercises/shipping.dart';
import 'package:flutter/material.dart';

class ShippingHome extends StatefulWidget {
  const ShippingHome({super.key});

  @override
  State<ShippingHome> createState() => _ShippingHomeState();
}

class _ShippingHomeState extends State<ShippingHome> {
  late String oriContactName;
  late String destContactName;
  late String oriAddress;
  late String destAddress;
  double shippingCost = 0;
  String? shippingMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shipping Address"),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: "Your Name",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  oriContactName = value;
                },
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Origin Address",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  oriAddress = value;
                },
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Destination Address Contact Name",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  destContactName = value;
                },
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Destination Address",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  destAddress = value;
                },
              ),
              const SizedBox(height: 15),
              const Text(
                "Select Shipping Method: ",
                style: TextStyle(fontSize: 16),
              ),
              RadioListTile(
                title: const Text("FedEx"),
                value: 'fedex',
                groupValue: shippingMethod,
                onChanged: (value) {
                  Order order = Order(
                      ShippingOptions.fedex,
                      Address(destContactName, destAddress),
                      Address(oriContactName, oriAddress));

                  setState(() {
                    shippingMethod = value.toString();
                    shippingCost =
                        ShippingCostCalculatorService.calculateShippingCost(
                            order);
                  });
                },
              ),
              RadioListTile(
                title: const Text("Ups"),
                value: 'Ups',
                groupValue: shippingMethod,
                onChanged: (value) {
                  Order order = Order(
                      ShippingOptions.ups,
                      Address(destContactName, destAddress),
                      Address(oriContactName, oriAddress));
                  setState(() {
                    shippingMethod = value.toString();
                    shippingCost =
                        ShippingCostCalculatorService.calculateShippingCost(
                            order);
                  });
                },
              ),
              RadioListTile(
                title: const Text("Purulator"),
                value: 'Purulator',
                groupValue: shippingMethod,
                onChanged: (value) {
                  Order order = Order(
                      ShippingOptions.purulator,
                      Address(destContactName, destAddress),
                      Address(oriContactName, oriAddress));
                  setState(() {
                    shippingMethod = value.toString();
                    shippingCost =
                        ShippingCostCalculatorService.calculateShippingCost(
                            order);
                  });
                },
              ),
              RadioListTile(
                title: const Text("Amazon Delivery"),
                value: 'Amazon',
                groupValue: shippingMethod,
                onChanged: (value) {
                  Order order = Order(
                      ShippingOptions.amazon,
                      Address(destContactName, destAddress),
                      Address(oriContactName, oriAddress));
                  setState(() {
                    shippingMethod = value.toString();
                    shippingCost =
                        ShippingCostCalculatorService.calculateShippingCost(
                            order);
                  });
                },
              ),
              const SizedBox(height: 20),
              shippingCost != 0
                  ? Text(
                      "Shipping cost is " + shippingCost.toString(),
                      style: const TextStyle(fontSize: 20),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
