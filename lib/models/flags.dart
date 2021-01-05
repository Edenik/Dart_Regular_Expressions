enum ExpressionFlag { isCaseSensitive, isDotAll, isMultiLine, isUnicode }
RegExp caseSensitivityRegex = new RegExp(r'[A-Z]', caseSensitive: true);

class Flags {
  bool _isCaseSensitive;
  bool _isDotAll;
  bool _isMultiLine;
  bool _isUnicode;

  Flags(this._isCaseSensitive, this._isDotAll, this._isMultiLine,
      this._isUnicode);

  setFlagStatus(ExpressionFlag flag) {
    switch (flag) {
      case ExpressionFlag.isCaseSensitive:
        _isCaseSensitive = !_isCaseSensitive;
        break;
      case ExpressionFlag.isDotAll:
        _isDotAll = !_isDotAll;
        break;
      case ExpressionFlag.isMultiLine:
        _isMultiLine = !_isMultiLine;
        break;
      case ExpressionFlag.isUnicode:
        _isUnicode = !_isUnicode;
        break;
    }
  }

  getFlagStatus(ExpressionFlag flag) {
    switch (flag) {
      case ExpressionFlag.isCaseSensitive:
        return _isCaseSensitive;
        break;
      case ExpressionFlag.isDotAll:
        return _isDotAll;
        break;
      case ExpressionFlag.isMultiLine:
        return _isMultiLine;
        break;
      case ExpressionFlag.isUnicode:
        return _isUnicode;
        break;
    }
  }

  List<String> toList() {
    List<String> flags = [];
    if (_isCaseSensitive == true)
      flags.add(getFlagName(ExpressionFlag.isCaseSensitive));
    if (_isDotAll == true) flags.add(getFlagName(ExpressionFlag.isDotAll));
    if (_isMultiLine == true)
      flags.add(getFlagName(ExpressionFlag.isMultiLine));
    if (_isUnicode == true) flags.add(getFlagName(ExpressionFlag.isUnicode));
    if (flags.length == 0) flags.add('None');
    return flags;
  }

  String getFlagName(ExpressionFlag flag) {
    String flagString;
    switch (flag) {
      case ExpressionFlag.isCaseSensitive:
        flagString = 'Case Sensitive';
        break;
      case ExpressionFlag.isDotAll:
        flagString = 'Dot All';
        break;
      case ExpressionFlag.isMultiLine:
        flagString = 'Multi Line';
        break;
      case ExpressionFlag.isUnicode:
        flagString = 'Unicode';
        break;
      default:
        break;
    }
    return flagString;
  }

  ExpressionFlag getExpressionFlagByString(String string) {
    switch (string) {
      case 'Case Sensitive':
        return ExpressionFlag.isCaseSensitive;
        break;
      case 'Dot All':
        return ExpressionFlag.isDotAll;
        break;
      case 'Multi Line':
        return ExpressionFlag.isMultiLine;
        break;
      case 'Unicode':
        return ExpressionFlag.isUnicode;
        break;
      default:
        return null;
        break;
    }
  }

  int getFlagsCounter() {
    int counter = 0;
    if (_isCaseSensitive == true) counter++;
    if (_isDotAll == true) counter++;
    if (_isMultiLine == true) counter++;
    if (_isUnicode == true) counter++;
    return counter;
  }

  RegExp getRegexStringWithFlags(String regexString) {
    RegExp regex;
    try {
      Pattern pattern = regexString;
      regex = new RegExp(
        pattern,
        caseSensitive: _isCaseSensitive,
        multiLine: _isMultiLine,
        dotAll: _isDotAll,
        unicode: _isUnicode,
      );
    } catch (e) {
      // regex isn't valid - no matches
    }

    return regex;
  }
}
