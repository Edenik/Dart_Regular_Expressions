import 'package:flutter/material.dart';
import '../screens/tests_screen.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text('Tests'),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => TestsScreen())),
      ),
    );
  }
}
