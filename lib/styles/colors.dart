import 'package:flutter/material.dart';

class Colors {
  Color _backgroundColor = Color(0XFFFFFFFF);
  Color _mainColor = Color(0XFFfaeed2);
  Color _focusColor = Color(0xFFf2d18e);
  Color _hintColor = Color(0xFF9e9e9e);

  Color backgroundColor(double opacity) {
    return this._backgroundColor.withOpacity(opacity);
  }

  Color mainColor(double opacity) {
    return this._mainColor.withOpacity(opacity);
  }

  Color focusColor(double opacity) {
    return this._focusColor.withOpacity(opacity);
  }

  Color hintColor(double opacity) {
    return this._hintColor.withOpacity(opacity);
  }
}
