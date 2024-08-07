import 'package:flutter/material.dart';
import 'package:seven_learn_exercise_four/model/contact_model.dart';
import 'package:seven_learn_exercise_four/view/screen/contact_detail_screen.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({super.key, required this.contact});

  final ContactModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            // BlocProvider.of<ContactBloc>(context).add(ContactListSuccessOperation(contact));
            return const ContactDetailScreen();
          },
          settings: RouteSettings(arguments: contact))),
      title: Text('${contact.firstName} ${contact.lastName}'),
      leading: CircleAvatar(
          radius: 23,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          foregroundImage:
              contact.avatar != null ? MemoryImage(contact.avatar!) : null,
          child: contact.avatar == null
              ? Text(
                  contact.firstName[0].toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                )
              : null),
    );
  }
}
