import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import "package:intl/intl.dart";
import 'package:intl/date_symbol_data_local.dart';

class AppState extends Model {
  List<TimelineItem> _timelineItems = [
    TimelineItem(
      time: DateTime(2019, 9, 1, 8, 30),
      name: "Al-Sufi (Azophi)",
      content:
          "One of Al-Sufi's greatest works involved fact-checking the Greek astronomer Ptolemy's measurements of the brightness and size of stars. In the year 964 AD, Al-Sufi published his findings in a book titled Kitab al-Kawatib al-Thabita al-Musawwar, or The Book of Fixed Stars. In many cases, he confirmed Ptolemy’s discoveries, but he also improved upon his work by illustrating the constellations and correcting some of Ptolemy’s observations about the brightness of stars.",
      icon: Icon(Icons.star, color: Colors.white),
      iconBackground: Colors.cyan
    ),
    TimelineItem(
      time: DateTime(2019, 8, 31, 23, 30),
      name: "Abu al-Wafa’ al-Buzjani",
      content:
          " Abu al-Wafa' is an innovator whose contributions to science include one of the first known introductions to negative numbers, and the development of the first quadrant, a tool used by astronomers to examine the sky. His pioneering work in spherical trigonometry was hugely influential for both mathematics and astronomy.",
      icon: Icon(
        Icons.exposure,
        color: Colors.white,
      ),
      iconBackground: Colors.redAccent
    ),
    TimelineItem(
      time: DateTime(2019, 7, 1, 8, 30),
      name: "hoge",
      content:
          "hogehoge",
      icon: Icon(Icons.star, color: Colors.white),
      iconBackground: Colors.cyan
    ),
    TimelineItem(
      time: DateTime(2019, 6, 1, 8, 30),
      name: "fuga",
      content:
          "fugafuga",
      icon: Icon(Icons.star, color: Colors.white),
      iconBackground: Colors.cyan
    ),
  ];

  List<TimelineItem> get timelineItems => _timelineItems;
  void addTimelineItem(TimelineItem item) {
    List<TimelineItem> newList = [item];
    newList.addAll(_timelineItems);
    _timelineItems = newList;

    notifyListeners();
  }

  static AppState of(BuildContext context) => ScopedModel.of<AppState>(context);
}

class TimelineItem {
  final DateTime time;
  final String name;
  final String content;
  final Color iconBackground;
  final Icon icon;
  const TimelineItem(
      {this.time,
      this.name,
      this.content,
      this.icon,
      this.iconBackground});

  get timeString {
    initializeDateFormatting("ja_JP");

    var formatter = new DateFormat('yyyy/MM/dd(E) HH:mm', "ja_JP");
    var formatted = formatter.format(this.time);
    return formatted;
  }
}
