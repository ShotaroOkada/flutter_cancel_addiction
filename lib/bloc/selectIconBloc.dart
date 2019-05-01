import 'dart:async';
import 'package:flutter/material.dart';

class SelectIcon {
  List<IconData> _selectIcons = [];

  final _selectIconStateController = StreamController<List<IconData>>();

  StreamSink<List<IconData>> get _inSelectIcon => _selectIconStateController.sink;

  Stream<List<IconData>> get selectIcon => _selectIconStateController.stream;

  final _selectIconEventController = StreamController<IconData>();

  Sink<IconData> get selectIconEventSink => _selectIconEventController.sink;

  SelectIcon() {
    _selectIconEventController.stream.listen(_mapEventState);
  }

  void _mapEventState(IconData iconData) {
    _selectIcons.add(iconData);

    _inSelectIcon.add(_selectIcons);
  }

  void dispose() {
    _selectIconStateController.close();
    _selectIconEventController.close();
  }
}