import 'dart:async';
import 'dart:math';
import 'package:design_pattern/observer_design_pattern/exercises/timer_controller.dart';
import 'package:flutter/material.dart';

class SetStateHome extends StatefulWidget {
  final String title;

  const SetStateHome({Key? key, required this.title}) : super(key: key);

  @override
  State<SetStateHome> createState() => _SetStateHomeState();
}

class _SetStateHomeState extends State<SetStateHome> {
  late TimerController _timerController;

  @override
  void initState() {
    _timerController = TimerController();
    super.initState();
  }

  @override
  void dispose() {
    /// this triggers our 'actua' dispose code in the controller
    _timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      _timerController.eventStreamSink.add(EventTimer.timeOut);
      debugPrint("sent event");
    });
    Random rnd = Random();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 8,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: List.generate(
                64,
                (index) =>
                    //  AnimatedOpacity(
                    /// If the widget is visible, animate to 0.2 (barely visible).
                    /// If the widget is hidden, animate to 1.0 (fully visible).
                    // opacity: rnd.nextBool() ? 1.0 : 0.2,
                    // duration: const Duration(milliseconds: 200),

                    /// This is the child of the AnimatedOpacity widget, which is
                    /// basically a [Container] with a black color and which
                    /// represents the whole single tile
                    ///
                    StreamBuilder(
                        stream: _timerController.eventStream,
                        initialData: 0,
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              color: Colors.black,
                              child: Center(
                                child: Text(
                                  rnd.nextInt(10).toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }
                          return const SizedBox();
                        }),
                //     Container(
                //   color: Colors.black,
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: <Widget>[
                //       Text(
                //         "data",
                //         style: TextStyle(color: Colors.white),
                //       )
                //     ],
                //   ),
                // ),
                // ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     /// Call setState. This tells Flutter to rebuild the
      //     /// UI with the changes.
      //     setState(() {
      //       /// do nothing except trigger the UI repaint
      //     });
      //   },
      //   tooltip: 'Toggle Opacity',
      //   child: const Icon(Icons.flip),
      // ),
    );
  }
}
