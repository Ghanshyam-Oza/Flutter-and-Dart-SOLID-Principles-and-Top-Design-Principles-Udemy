import 'package:flutter/material.dart';

import '../file_manager.dart';

class ShowAuditFilePage extends StatefulWidget {
  const ShowAuditFilePage({Key? key}) : super(key: key);

  @override
  ShowAuditFilePageState createState() => ShowAuditFilePageState();
}

class ShowAuditFilePageState extends State<ShowAuditFilePage> {
  String content = 'Loading...';
  String filePath = 'Loading...';

  @override
  void initState() {
    super.initState();
    loadFileData();
  }

  void loadFileData() async {
    String contentData = await FileAuditManager().readContent();
    String filePathData = await FileAuditManager().getFilePath();
    setState(() {
      content = contentData;
      filePath = filePathData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: 8.0, right: 16.0, top: 16.0, bottom: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'File Path: $filePath',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'File Content:\n$content',
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: loadFileData,
                child: const Text('Refresh'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
