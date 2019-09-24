import 'package:diabetes_memo/domain/timeline_item.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:diabetes_memo/data/app_state.dart';
import 'dart:math';

class MemoDialog extends StatelessWidget {
  final rand = new Random();

  MemoDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MemoDialogConsts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    int bloodGlucoseLevel = 0;
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: MemoDialogConsts.padding,
            bottom: MemoDialogConsts.padding,
            left: MemoDialogConsts.padding,
            right: MemoDialogConsts.padding,
          ),
          margin: EdgeInsets.only(top: MemoDialogConsts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(MemoDialogConsts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    labelText: "血糖値",
                    suffixText: "mg/dL",
                  ),
                  onChanged: (value) {
                    try {
                      bloodGlucoseLevel = int.parse(value);
                    } catch (exception) {}
                  },
                ),
              ),
              SizedBox(height: 16.0),
              DefaultTabController(
                length: 3,
                child: TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  tabs: <Widget>[
                    Tab(
                      text: '血糖値',
                    ),
                    Tab(
                      text: "投薬",
                    ),
                    Tab(
                      text: "食事",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: ScopedModelDescendant<AppState>(
                  builder: (context, child, model) => FlatButton(
                    onPressed: () {
                      final icons = [
                        Icons.add,
                        Icons.add_a_photo,
                        Icons.airline_seat_flat_angled,
                        Icons.alarm,
                        Icons.book
                      ];
                      model.addTimelineItem(TimelineItem(
                          time: DateTime.now(),
                          content: "血糖値: $bloodGlucoseLevel",
                          icon: Icon(icons[rand.nextInt(icons.length)])));
                      Navigator.of(context).pop(); // To close the dialog
                    },
                    child: Text("buttonText"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MemoDialogConsts {
  MemoDialogConsts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
