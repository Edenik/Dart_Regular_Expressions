import 'package:flutter/material.dart';

class TestStringInputWidget extends StatefulWidget {
  final Function onTestStringChange;

  TestStringInputWidget({@required this.onTestStringChange});

  @override
  _TestStringInputWidgetState createState() => _TestStringInputWidgetState();
}

class _TestStringInputWidgetState extends State<TestStringInputWidget> {
  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Test String'),
        Divider(color: Colors.black),
        Container(
          height: 200,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
            child: TextFormField(
              onChanged: (value) => widget.onTestStringChange(_controller.text),
              controller: _controller,
              minLines: 14,
              maxLines: 14,
            ),
          ),
        )
      ],
    );
  }
}
