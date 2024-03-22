import 'package:flutter/material.dart';

import '../file_manager.dart';

class LogMessagePage extends StatefulWidget {
  const LogMessagePage({Key? key}) : super(key: key);

  @override
  LogMessagePageState createState() => LogMessagePageState();
}

class LogMessagePageState extends State<LogMessagePage> {
  final TextEditingController _controller = TextEditingController();

  void _logMessage() async {
    await FileAuditManager().logMessage(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter message',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _logMessage,
              child: const Text('Log Message'),
            ),
          ],
        ),
      ),
    );
  }
}
