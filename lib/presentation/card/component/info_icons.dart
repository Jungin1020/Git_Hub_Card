import 'package:flutter/material.dart';

class InfoIcons {
  static const _kFontFam = 'InfoIcons';
  static const String? _kFontPkg = null;

  static const mail =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const docs =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const network =
      IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const globe =
      IconData(0xe807, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const cloud =
      IconData(0xe808, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const attach =
      IconData(0xe809, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const link =
      IconData(0xe80a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const share =
      IconData(0xe80b, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  final icons = [docs, network, mail, attach];
}
