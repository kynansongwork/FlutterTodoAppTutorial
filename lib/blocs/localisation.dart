import 'dart:async';

import 'package:flutter/material.dart';

class FlutterBlocLocalisations {
  static FlutterBlocLocalisations of(BuildContext context) {
    return Localizations.of<FlutterBlocLocalisations>(
      context,
      FlutterBlocLocalisations,
    );
  }

  String get appTitle => "Flutter Todos";
}

class FlutterBlocLocalisationsDelegate extends LocalizationsDelegate<FlutterBlocLocalisations> {
  
  @override
  Future<FlutterBlocLocalisations> load(Locale locale) =>
    Future(() => FlutterBlocLocalisations());

  @override
  bool shouldReload(FlutterBlocLocalisationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) =>
    locale.languageCode.toLowerCase().contains("en");
}