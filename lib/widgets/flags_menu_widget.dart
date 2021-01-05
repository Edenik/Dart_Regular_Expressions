import 'package:flutter/material.dart';
import '../models/flags.dart';

class FlagsMenuWidget extends StatelessWidget {
  final Flags flags;
  final Function onFlagsChange;
  FlagsMenuWidget({@required this.flags, @required this.onFlagsChange});

  @override
  Widget build(BuildContext context) {
    int _checkedFlags = flags.getFlagsCounter();
    return PopupMenuButton<ExpressionFlag>(
      tooltip: 'Flags',
      icon: Icon(
        Icons.flag,
        color: _checkedFlags == 0
            ? Colors.grey[300]
            : _checkedFlags == 1
                ? Colors.grey[500]
                : _checkedFlags == 2
                    ? Colors.grey[700]
                    : _checkedFlags == 3
                        ? Colors.grey[800]
                        : Colors.grey[900],
      ),
      onSelected: (ExpressionFlag result) {
        // flags.setFlagStatus(result);
        // setState(() => _checkedFlags = widget.flags.getFlagsCounter());
        // _onRegexChange();
        flags.setFlagStatus(result);
        onFlagsChange(flags);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ExpressionFlag>>[
        CheckedPopupMenuItem<ExpressionFlag>(
          checked: flags.getFlagStatus(ExpressionFlag.isCaseSensitive),
          value: ExpressionFlag.isCaseSensitive,
          child: Text(flags.getFlagName(ExpressionFlag.isCaseSensitive)),
        ),
        const PopupMenuDivider(),
        CheckedPopupMenuItem<ExpressionFlag>(
          checked: flags.getFlagStatus(ExpressionFlag.isDotAll),
          value: ExpressionFlag.isDotAll,
          child: Text(flags.getFlagName(ExpressionFlag.isDotAll)),
        ),
        const PopupMenuDivider(),
        CheckedPopupMenuItem<ExpressionFlag>(
          checked: flags.getFlagStatus(ExpressionFlag.isMultiLine),
          value: ExpressionFlag.isMultiLine,
          child: Text(flags.getFlagName(ExpressionFlag.isMultiLine)),
        ),
        const PopupMenuDivider(),
        CheckedPopupMenuItem<ExpressionFlag>(
          checked: flags.getFlagStatus(ExpressionFlag.isUnicode),
          value: ExpressionFlag.isUnicode,
          child: Text(flags.getFlagName(ExpressionFlag.isUnicode)),
        ),
      ],
    );
  }
}
