import 'package:flutter/material.dart';
import '../models/flags.dart';
import '../widgets/flags_menu_widget.dart';

class ActivatedFlagsWidget extends StatefulWidget {
  final Flags flags;
  final Function onFlagsChange;
  ActivatedFlagsWidget({@required this.flags, @required this.onFlagsChange});

  @override
  _ActivatedFlagsWidgetState createState() => _ActivatedFlagsWidgetState();
}

class _ActivatedFlagsWidgetState extends State<ActivatedFlagsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 30),
                Text('Activated Flags'),
              ],
            ),
            FlagsMenuWidget(
              flags: widget.flags,
              onFlagsChange: (Flags flags) => widget.onFlagsChange(flags),
            ),
          ],
        ),
        Divider(
          color: Colors.black,
          thickness: 1,
        ),
        SizedBox(height: 5),
        Wrap(
          spacing: 5.0,
          alignment: WrapAlignment.center,
          children:
              List<Widget>.generate(widget.flags.toList().length, (int index) {
            return Chip(
              label: Text(widget.flags.toList()[index]),
              backgroundColor: Colors.blueGrey[300],
              onDeleted: widget.flags.toList()[index] == 'None'
                  ? null
                  : () {
                      widget.flags.setFlagStatus(widget.flags
                          .getExpressionFlagByString(
                              widget.flags.toList()[index]));
                      widget.onFlagsChange(widget.flags);
                    },
            );
          }),
        )
      ],
    );
  }
}
