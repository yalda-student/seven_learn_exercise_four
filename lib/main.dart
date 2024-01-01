import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:seven_learn_exercise_four/gen/fonts.gen.dart';
import 'package:seven_learn_exercise_four/model/contact_model.dart';
import 'package:seven_learn_exercise_four/view/screen/bloc/contact_list_bloc.dart';
import 'package:seven_learn_exercise_four/view/screen/contact_list/contact_list_screen.dart';

const String contactBox = 'contact-box';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ContactModelAdapter());
  await Hive.openBox<ContactModel>(contactBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactBloc>(
      create: (context) => ContactBloc(),
      child: MaterialApp(
        title: 'Phone Book',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: FontFamily.comicSans,
            appBarTheme: const AppBarTheme(
                elevation: 0,
                centerTitle: true,
                backgroundColor: Color(0xff2D3250),
                titleTextStyle: TextStyle(
                    fontSize: 22,
                    fontFamily: FontFamily.comicSans,
                    color: Colors.white)),
            colorScheme: const ColorScheme.dark(
              background: Color(0xff2D3250),
              primary: Color(0xffF6B17A),
              secondary: Color(0xff7077A1),
              surface: Color(0xff424769),
            ),
            inputDecorationTheme: InputDecorationTheme(
              enabledBorder: _textFieldBorder,
              focusedBorder: _textFieldBorder,
              border: _textFieldBorder,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            )),
        home: const ContactListScreen(),
      ),
    );
  }
}

final _textFieldBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(color: Color(0xff7077A1), width: 2),
);
