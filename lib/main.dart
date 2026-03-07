import 'package:abdullah/screens/female_filters_screen.dart';
import 'package:abdullah/screens/login_screen.dart';
import 'package:abdullah/screens/main_screen.dart';
import 'package:abdullah/screens/male_filters_screen.dart';
import 'package:abdullah/screens/profiles_screen.dart';
import 'package:flutter/material.dart';
import 'screens/profile_screen.dart';
import 'screens/cities_screen.dart';
import 'screens/main_screen.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.pinkAccent);

void main() {
  runApp(
      MaterialApp(
        theme: ThemeData().copyWith(
            colorScheme: kColorScheme,
            appBarTheme: AppBarTheme().copyWith(
                backgroundColor: kColorScheme.primary,
                foregroundColor: kColorScheme.onPrimary
            ),
            textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(color: kColorScheme.onPrimary, fontSize: 20)
            )
        ),
          home: LoginScreen(),
        debugShowCheckedModeBanner: false,
      ));
}
