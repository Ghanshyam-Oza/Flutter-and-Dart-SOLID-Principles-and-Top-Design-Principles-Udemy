import 'package:flutter/material.dart';
import 'package:design_pattern/stratergy_pattern/renderer.dart';

class StratergyHomePage extends StatefulWidget {
  const StratergyHomePage({Key? key}) : super(key: key);

  @override
  State<StratergyHomePage> createState() => _StratergyHomePageState();
}

class _StratergyHomePageState extends State<StratergyHomePage> {
  String? renderer;
  Renderer? currRenderer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Strategy Design Pattern'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            const Text(
              "Choose your Renderer",
              style: TextStyle(fontSize: 18),
            ),
            const Divider(),
            RadioListTile(
              title: const Text("Render Image"),
              value: "image",
              groupValue: renderer,
              onChanged: (value) {
                setState(() {
                  renderer = value.toString();
                  currRenderer = ImageRenderer();
                });
              },
            ),
            RadioListTile(
              title: const Text("Render Button"),
              value: "button",
              groupValue: renderer,
              onChanged: (value) {
                setState(() {
                  renderer = value.toString();
                  currRenderer = ButtonRenderer();
                });
              },
            ),
            RadioListTile(
              title: const Text("Render Widget"),
              value: "widget",
              groupValue: renderer,
              onChanged: (value) {
                setState(() {
                  renderer = value.toString();
                  currRenderer = WidgetRenderer();
                });
              },
            ),
            const Divider(),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              child: currRenderer?.render(),
            )
          ],
        ),
      ),
    );
  }
}
