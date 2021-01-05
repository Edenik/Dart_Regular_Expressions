import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TestsScreen extends StatefulWidget {
  @override
  _TestsScreenState createState() => _TestsScreenState();
}

class _TestsScreenState extends State<TestsScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Test Screen'),
      ),
      body: Column(
        children: [
          Text('Code Blocks'),
          Text('Formatted Dart Code'),
          FlatButton(
            child: Text('ff'),
            onPressed: () => firstOne(),
          ),
          Container(
            height: 300,
            child: Markdown(
              controller: controller,
              selectable: true,
              data: 'getFunctionAsString(helloWorld)',
            ),
          )
        ],
      ),
    );
  }

  firstOne() {
    final txt = "Programming courses always starts wit a hello world example";

    final regex1 = new RegExp('hello');
    print(regex1.allMatches(txt).first.group(0));
    print(regex1);
  }
}
