import 'package:flutter/material.dart';
import 'counter_controller.dart';

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({Key? key}) : super(key: key);

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

/// The main Widget of our UI
///
class _StreamHomePageState extends State<StreamHomePage> {
  /// This is the controller that we will use to track data changes
  ///
  late CounterController _counterController;

  @override

  /// Initialize our state controller which will track the counter data changes
  ///
  void initState() {
    _counterController = CounterController();
    super.initState();
  }

  @override

  /// We need to dispose of the Controller and all the streams when the Widget
  /// is being disposed of.
  ///
  void dispose() {
    /// this triggers our 'actua' dispose code in the controller
    _counterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the StreamHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Streams Demo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(),
          Center(
              child: StreamBuilder<int>(
                  stream: _counterController.counterStream,
                  initialData: 0,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<int> snapshot,
                  ) {
                    if (snapshot.hasData) {
                      debugPrint(
                          '_StreamHomePageState - <receive> <event notification> data: ${snapshot.data}');
                      return Text(
                        '${snapshot.data}',
                        style: Theme.of(context).textTheme.headline4,
                      );
                    } else {
                      return Text(
                        'Empty data',
                        style: Theme.of(context).textTheme.headline4,
                      );
                    }
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  debugPrint('_StreamHomePageState - <send> <event trigger>');
                  _counterController.eventSink.add(Event.decrement);
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  debugPrint('_StreamHomePageState - <send> <event trigger>');
                  _counterController.eventSink.add(Event.increment);
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
