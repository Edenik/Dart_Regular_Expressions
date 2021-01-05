import 'package:flutter/material.dart';
import '../models/flags.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RegExp _regex;
  String _testString;
  Flags _flags = new Flags(true, false, false, false);

  List<RegExpMatch> _matches;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dart Regular Expressions'),
        centerTitle: true,
      ),
      // drawer: DrawerWidget(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width > 600
                    ? 600
                    : MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RegexInputWidget(
                      onRegexPatternChange: _onRegexPatternChange,
                      flags: _flags,
                      matches: _matches?.length ?? 0,
                    ),
                    const SizedBox(height: 30),
                    ActivatedFlagsWidget(
                      flags: _flags,
                      onFlagsChange: (Flags flags) => {
                        setState(() => {
                              _flags = flags,
                              if (_regex?.pattern != null)
                                {
                                  _regex = new RegExp(
                                    _regex.pattern,
                                    caseSensitive: flags.getFlagStatus(
                                        ExpressionFlag.isCaseSensitive),
                                    dotAll: flags
                                        .getFlagStatus(ExpressionFlag.isDotAll),
                                    multiLine: flags.getFlagStatus(
                                        ExpressionFlag.isMultiLine),
                                    unicode: flags.getFlagStatus(
                                        ExpressionFlag.isUnicode),
                                  ),
                                }
                            }),
                        _checkRegex(),
                      },
                    ),
                    const SizedBox(height: 30),
                    TestStringInputWidget(
                        onTestStringChange: _onTestStringChange),
                    const SizedBox(height: 30),
                    MatchesWidget(matches: _matches),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onRegexPatternChange(RegExp pattern, Flags flags) => {
        setState(() => {_regex = pattern, _flags = flags}),
        _checkRegex(),
      };

  _onTestStringChange(String testString) => {
        setState(() => _testString = testString),
        _checkRegex(),
      };

  _checkRegex() {
    if (_regex != null &&
        _regex.pattern != '' &&
        _testString != null &&
        _testString != '') {
      setState(() => _matches = _regex.allMatches(_testString).toList());
    } else {
      //invalid regex or pattern
      setState(() => _matches = null);
    }
  }
}
