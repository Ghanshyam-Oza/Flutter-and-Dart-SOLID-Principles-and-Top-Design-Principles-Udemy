import 'dart:async';

enum EventTimer { timeOut }

class TimerController {
  final StreamController<EventTimer> _eventController =
      StreamController<EventTimer>.broadcast();
  StreamSink<EventTimer> get eventStreamSink => _eventController.sink;
  Stream<EventTimer> get eventStream => _eventController.stream;

  /// Dispose of the listener and close all relevant streams to eliminate any
  /// possible memory leaks
  dispose() {
    _eventController.close();
  }
}
