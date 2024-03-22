import 'package:flutter/foundation.dart';

abstract class TextEditorState {
  String enterText(String currentText, String newText);
  String bold(TextEditor txt, String currentText);
  String italic(TextEditor txt, String currentText);
  String underline(TextEditor txt, String currentText);
  String undo(TextEditor txt, String currentText);
  String redo(TextEditor txt, String currentText);
}

class DefaultState implements TextEditorState {
  @override
  String enterText(String currentText, String newText) {
    return currentText;
  }

  @override
  String bold(TextEditor txt, String currentText) {
    txt.setState(BoldState());
    txt.bold();
    return currentText;
  }

  @override
  String italic(TextEditor txt, String currentText) {
    txt.setState(ItalicState());
    txt.italic();
    return currentText;
  }

  @override
  String underline(TextEditor txt, String currentText) {
    txt.setState(UnderlineState());
    txt.underline();
    return currentText;
  }

  @override
  String undo(TextEditor txt, String currentText) {
    return 'Undo Changes';
  }

  @override
  String redo(TextEditor txt, String currentText) {
    return 'Redo Changes';
  }
}

class BoldState implements TextEditorState {
  @override
  String enterText(String currentText, String newText) {
    return currentText;
  }

  @override
  String bold(TextEditor txt, String currentText) {
    txt._history.add("bold");
    txt._historyIndex++;
    debugPrint(txt._history.getRange(0, txt._historyIndex + 1).toString());
    return 'Bold Text';
  }

  @override
  String italic(TextEditor txt, String currentText) {
    txt.setState(ItalicState());
    txt.italic();
    return currentText;
  }

  @override
  String underline(TextEditor txt, String currentText) {
    txt.setState(UnderlineState());
    txt.underline();
    return currentText;
  }

  @override
  String undo(TextEditor txt, String currentText) {
    txt._historyIndex >= 0 ? txt._historyIndex-- : txt._historyIndex;
    debugPrint(txt._history.getRange(0, txt._historyIndex + 1).toString());
    return 'Undo Changes';
  }

  @override
  String redo(TextEditor txt, String currentText) {
    txt._history.length - 1 > txt._historyIndex
        ? txt._historyIndex++
        : txt._historyIndex;
    debugPrint(txt._history.getRange(0, txt._historyIndex + 1).toString());
    return 'Redo Changes';
  }
}

class ItalicState implements TextEditorState {
  @override
  String enterText(String currentText, String newText) {
    return currentText;
  }

  @override
  String bold(TextEditor txt, String currentText) {
    txt.setState(BoldState());
    txt.bold();
    return currentText;
  }

  @override
  String italic(TextEditor txt, String currentText) {
    txt._history.add("Italic");
    txt._historyIndex++;
    debugPrint(txt._history.getRange(0, txt._historyIndex + 1).toString());
    return 'Italic Text';
  }

  @override
  String underline(TextEditor txt, String currentText) {
    txt.setState(UnderlineState());
    txt.underline();
    return currentText;
  }

  @override
  String undo(TextEditor txt, String currentText) {
    txt._historyIndex >= 0 ? txt._historyIndex-- : txt._historyIndex;
    debugPrint(txt._history.getRange(0, txt._historyIndex + 1).toString());
    return 'Undo Changes';
  }

  @override
  String redo(TextEditor txt, String currentText) {
    txt._history.length - 1 > txt._historyIndex
        ? txt._historyIndex++
        : txt._historyIndex;
    debugPrint(txt._history.getRange(0, txt._historyIndex + 1).toString());
    return 'Redo Changes';
  }
}

class UnderlineState implements TextEditorState {
  @override
  String enterText(String currentText, String newText) {
    return currentText;
  }

  @override
  String bold(TextEditor txt, String currentText) {
    txt.setState(BoldState());
    txt.bold();
    return currentText;
  }

  @override
  String italic(TextEditor txt, String currentText) {
    txt.setState(ItalicState());
    txt.italic();
    return currentText;
  }

  @override
  String underline(TextEditor txt, String currentText) {
    txt._history.add("underline");
    txt._historyIndex++;
    debugPrint(txt._history.getRange(0, txt._historyIndex + 1).toString());
    return 'Underline text';
  }

  @override
  String undo(TextEditor txt, String currentText) {
    txt._historyIndex >= 0 ? txt._historyIndex-- : txt._historyIndex;
    debugPrint(txt._history.getRange(0, txt._historyIndex + 1).toString());
    return 'Undo Changes';
  }

  @override
  String redo(TextEditor txt, String currentText) {
    txt._history.length - 1 > txt._historyIndex
        ? txt._historyIndex++
        : txt._historyIndex;
    debugPrint(txt._history.getRange(0, txt._historyIndex + 1).toString());
    return 'Redo Changes';
  }
}

// TextEditor class using State Design Pattern
class TextEditor {
  late TextEditorState _state;
  String _currentText = "";
  List<String> _history = [];
  int _historyIndex = -1;

  TextEditor() {
    _state = DefaultState();
  }

  void setState(TextEditorState state) {
    _state = state;
  }

  void enterText(String newText) {
    _currentText = newText;
  }

  void bold() {
    _state.bold(this, _currentText);
  }

  void italic() {
    _state.italic(this, _currentText);
  }

  void underline() {
    _state.underline(this, _currentText);
  }

  void undo() {
    _state.undo(this, _currentText);
  }

  void redo() {
    _state.redo(this, _currentText);
  }
}
