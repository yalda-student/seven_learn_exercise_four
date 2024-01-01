import 'package:flutter/material.dart';
import 'package:seven_learn_exercise_four/view/contact_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Book',
      theme: ThemeData(
        appBarTheme: AppBarTheme(elevation: 0),
        colorScheme: ColorScheme.dark(
          background: Color(0xff2D3250),
          primary: Color(0xffF6B17A)
        ),
        useMaterial3: true,
      ),
      home: const ContactListScreen(),
    );
  }
}
