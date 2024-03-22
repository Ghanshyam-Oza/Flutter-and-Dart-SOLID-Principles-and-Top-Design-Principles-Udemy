import 'package:design_pattern/factory_method/shape.dart';
import 'package:design_pattern/factory_method/utils.dart';
import 'package:flutter/material.dart';

/// global state data
Shape currShape = NullShape();

/// Our Main Widget Scaffolding
///
class MyFactoryHomePage extends StatefulWidget {
  const MyFactoryHomePage({super.key});

  @override
  State<MyFactoryHomePage> createState() => _MyFactoryHomePageState();
}

/// Bulk of the inside of our stateful-widget
///
/// We create a simple canvas container [400x400] in which we will render our
/// shapes.
/// We use a custom painter to delegate drawing anything to the canvas.
class _MyFactoryHomePageState extends State<MyFactoryHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factory Method Pattern'),
      ),
      body: ListView(children: <Widget>[
        Text(
          '${currShape.getName}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
        SizedBox(
          width: 400,
          height: 400,
          child: CustomPaint(
            painter: CanvasPainter(),
          ),
        ),
        ElevatedButton(
          child: const Text('Generate New Random Shape'),
          onPressed: () {
            setState(() {
              currShape = Utils.generateRandomShape(const Size(400, 400));
            });
          },
        ),
      ]),
    );
  }
}

/// our custom painter
/// We simply draw the current shape by delegating to its draw(Canvas) method
///
class CanvasPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    currShape.draw(canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
