import 'package:flutter/material.dart';
import '../models/flags.dart';

class RegexInputWidget extends StatefulWidget {
  final Function onRegexPatternChange;
  final Flags flags;
  final int matches;

  RegexInputWidget(
      {@required this.onRegexPatternChange,
      @required this.flags,
      @required this.matches});

  @override
  _RegexInputWidgetState createState() => _RegexInputWidgetState();
}

class _RegexInputWidgetState extends State<RegexInputWidget> {
  String patternString = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.0),
                Text('Regular Expression'),
              ],
            ),
          ],
        ),
        Divider(color: Colors.black),
        Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() => patternString = value);
                      _onRegexChange();
                    },
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  color: widget.matches == 0
                      ? Colors.grey[400]
                      : Colors.blueGrey[300],
                  width: 100,
                  height: 50,
                  child: Center(
                    child: Text('Matches: ${widget.matches}'),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  _onRegexChange() {
    RegExp regex = widget.flags.getRegexStringWithFlags(patternString);
    widget.onRegexPatternChange(regex, widget.flags);
  }
}
