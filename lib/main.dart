
import 'package:flutter/material.dart';
import 'package:parking/screens/configurations/configurations.dart';
import 'package:parking/screens/home/home.dart';
import 'package:parking/screens/new_habit/new_habit.dart';
import 'package:parking/theme.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: 'home',
      routes: {
        'home': (context) => const Home(),
        'new_habit': (context) =>   NewHabit(),
        'configurations': (context) => Configurations(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        colorScheme: MaterialTheme.lightScheme(),
      ),
      darkTheme: ThemeData.dark().copyWith( 
        colorScheme: MaterialTheme.darkScheme(),
      ),
    ),
  );
}
