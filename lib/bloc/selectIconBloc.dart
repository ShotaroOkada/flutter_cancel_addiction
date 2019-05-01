import 'dart:async';
import 'package:flutter/material.dart';

class SelectIcon {
  IconData _selectIconData;

  final _selectIconDataStateController = StreamController<IconData>();

  StreamSink<IconData> get _inSelectIcon => _selectIconDataStateController.sink;

  Stream<IconData> get selectIcon => _selectIconDataStateController.stream;

  final _selectIconEventController = StreamController<IconData>();

  Sink<IconData> get selectIconEventSink => _selectIconEventController.sink;

  SelectIcon() {
    _selectIconEventController.stream.listen(_mapEventState);
  }

  void _mapEventState(IconData icon) {
    // _selectIconData.add(icon);
    _selectIconData = icon;

    _inSelectIcon.add(_selectIconData);
  }

  void dispose() {
    _selectIconDataStateController.close();
    _selectIconEventController.close();
  }
}