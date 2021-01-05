import 'package:flutter/material.dart';

class MatchesWidget extends StatelessWidget {
  final List<RegExpMatch> matches;
  MatchesWidget({@required this.matches});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Matches'),
        Divider(color: Colors.black),
        matches == null || matches.length == 0
            ? Text('No matches')
            : Wrap(
                spacing: 10.0,
                alignment: WrapAlignment.center,
                children: List<Widget>.generate(matches.length, (int index) {
                  return Tooltip(
                    message:
                        'Match: ${index + 1}, Position: ${matches[index].start}-${matches[index].end}',
                    child: Chip(
                      label: Text(matches[index].group(0)),
                      backgroundColor: Colors.blueGrey[300],
                    ),
                  );
                }),
              )
      ],
    );
  }
}
