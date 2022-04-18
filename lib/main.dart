import 'package:flutter/material.dart';

import 'package:dashbook/dashbook.dart';
import 'package:google_fonts/google_fonts.dart';

/// The sample resources
final _resources = <String, dynamic>{
  '1 - Getting Started': ['Introduction', 'Fundamentals'],
  '2 - Advanced': ['Customize XXXXX', 'Customize YYYYY'],
  '3 - More Information': ['Contribution', 'License'],
};

void main() {
  final dashbook = Dashbook.dualTheme(
    title: 'My Dashbook',
    light: ThemeData(
      brightness: Brightness.light,
      typography: Typography.material2018(),
      textTheme: GoogleFonts.oxygenTextTheme(Typography.blackMountainView),
    ),
    dark: ThemeData(
      brightness: Brightness.dark,
      typography: Typography.material2018(),
      textTheme: GoogleFonts.oxygenTextTheme(Typography.whiteMountainView),
    ),
    initWithLight: false,
  );

  _addStories(dashbook);

  runApp(dashbook);
}

void _addStories(Dashbook dashbook) {
  for (final rootKey in _resources.keys) {
    final story = dashbook.storiesOf(rootKey);

    for (final page in (_resources[rootKey] as List<String>)) {
      story.add(
        page,
        (context) => Center(
          child: Text(page),
        ),
      );
    }
  }
}
