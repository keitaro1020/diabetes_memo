import 'package:diabetes_memo/domain/timeline_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AppState extends Model {
  List<TimelineItem> _timelineItems = [];

  List<TimelineItem> get timelineItems => _timelineItems;
  void addTimelineItem(TimelineItem item) {
    _timelineItems.insert(0, item);
    notifyListeners();
  }

  static AppState of(BuildContext context) => ScopedModel.of<AppState>(context);
}
