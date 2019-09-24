
import "package:intl/intl.dart";
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';

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
