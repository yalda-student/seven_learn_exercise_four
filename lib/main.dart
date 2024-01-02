import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:seven_learn_exercise_four/model/contact_model.dart';
import 'package:seven_learn_exercise_four/theme.dart';
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
        theme: appTheme,
        home: const ContactListScreen(),
      ),
    );
  }
}
