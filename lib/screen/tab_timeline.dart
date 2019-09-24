import 'package:diabetes_memo/domain/timeline_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:diabetes_memo/data/app_state.dart';
import 'package:diabetes_memo/screen/dialog_memo.dart';

class TimelineTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Scaffold(
      body: ScopedModelDescendant<AppState>(
        builder: (context, child, model) => Timeline.builder(
          itemBuilder: timelineBuilder,
          itemCount: model.timelineItems.length,
          physics: ClampingScrollPhysics(),
          position: TimelinePosition.Left,
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 90.0),
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => MemoDialog(),
            );
          },
          mini: false,
          child: Icon(Icons.add),
          backgroundColor: Colors.pink,
        ),
      ),
    ));
  }

  TimelineModel timelineBuilder(BuildContext context, int i) {
    List<TimelineItem> items = AppState.of(context).timelineItems;

    final item = items[i];
    final textTheme = Theme.of(context).textTheme;
    return TimelineModel(
      Card(
        margin: EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                item.timeString,
                style: textTheme.title,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                item.content,
                style: textTheme.body1,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
      isFirst: i == 0,
      isLast: i == items.length,
      iconBackground: item.iconBackground,
      icon: item.icon,
    );
  }
}
