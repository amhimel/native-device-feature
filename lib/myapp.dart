import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:native_device_features/screens/places_screen.dart';

final colorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 102, 6, 247),
    background: Color.fromARGB(255, 56, 49, 66),
  );
final theme = ThemeData().copyWith(
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
    titleSmall: GoogleFonts.ubuntuCondensed(
      fontWeight: FontWeight.bold
    ),
    titleMedium: GoogleFonts.ubuntuCondensed(
        fontWeight: FontWeight.bold
    ),
    titleLarge: GoogleFonts.ubuntuCondensed(
        fontWeight: FontWeight.bold
    ),

  ),
);


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Great places",
      theme: theme,
      home:PlacesScreen(),
    );
  }
}