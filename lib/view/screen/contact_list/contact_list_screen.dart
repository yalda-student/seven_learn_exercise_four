import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seven_learn_exercise_four/gen/assets.gen.dart';
import 'package:seven_learn_exercise_four/view/screen/contact_list/all_contacts_tab.dart';
import 'package:seven_learn_exercise_four/view/screen/edit_contact_screen.dart';

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Contacts'),
        ),
        body: const AllContactTab(),
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const EditContactScreen(),
                  // settings: RouteSettings(
                  //     arguments: ContactModel(
                  //         firstName: 'firstName',
                  //         lastName: 'lastName',
                  //         phone: 'phone',
                  //         birthdayDate: 'birthdayDate',
                  //         email: 'email')),
                )),
            child: SvgPicture.asset(Assets.icon.contact)),
      ),
    );
  }
}
