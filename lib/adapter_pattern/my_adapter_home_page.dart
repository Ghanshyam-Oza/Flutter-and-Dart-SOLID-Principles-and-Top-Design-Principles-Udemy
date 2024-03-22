import 'package:flutter/material.dart';

import 'list_with_separator.dart';

class MyAdapterHomePage extends StatefulWidget {
  const MyAdapterHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyAdapterHomePage> createState() => _MyAdapterHomePageState();
}

class _MyAdapterHomePageState extends State<MyAdapterHomePage> {
  Widget bodyWidget = XMLLongListWithSeparator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: const Text("XML"),
                  onTap: () {
                    setState(() {
                      bodyWidget = XMLLongListWithSeparator();
                    });
                  },
                ),
                PopupMenuItem(
                  child: const Text("JSON"),
                  onTap: () {
                    setState(() {
                      bodyWidget = JSONLongListWithSeparator();
                    });
                  },
                ),
                PopupMenuItem(
                  child: const Text("CSV"),
                  onTap: () {
                    setState(() {
                      bodyWidget = CSVLongListWithSeparator();
                    });
                  },
                ),
              ];
            },
          )
        ],
      ),
      body:
          bodyWidget, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
