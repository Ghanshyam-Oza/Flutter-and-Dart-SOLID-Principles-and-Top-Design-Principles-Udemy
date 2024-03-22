import 'package:design_pattern/state_design_pattern/exercises/text_editor.dart';
import 'package:flutter/material.dart';

class TextEditorHome extends StatefulWidget {
  const TextEditorHome({super.key});

  @override
  State<TextEditorHome> createState() => _TextEditorHomeState();
}

class _TextEditorHomeState extends State<TextEditorHome> {
  TextEditor txtEditor = TextEditor();

  @override
  void initState() {
    super.initState();
    txtEditor.enterText("Design Patterns");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Editor : State Pattern"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MaterialButton(
            color: Colors.yellow,
            onPressed: () {
              txtEditor.bold();
            },
            child: const Text("Bold"),
          ),
          MaterialButton(
            color: Colors.yellow,
            onPressed: () {
              txtEditor.italic();
            },
            child: const Text("Italic"),
          ),
          MaterialButton(
            color: Colors.yellow,
            onPressed: () {
              txtEditor.underline();
            },
            child: const Text("Underline"),
          ),
          MaterialButton(
            color: Colors.yellow,
            onPressed: () {
              txtEditor.undo();
            },
            child: const Text("Undo"),
          ),
          MaterialButton(
            color: Colors.yellow,
            onPressed: () {
              txtEditor.redo();
            },
            child: const Text("Redo"),
          ),
        ],
      ),
    );
  }
}
