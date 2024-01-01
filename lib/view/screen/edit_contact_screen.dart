import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:seven_learn_exercise_four/gen/assets.gen.dart';
import 'package:seven_learn_exercise_four/model/contact_model.dart';
import 'package:seven_learn_exercise_four/view/screen/bloc/contact_list_bloc.dart';

class EditContactScreen extends StatefulWidget {
  const EditContactScreen({super.key});

  @override
  State<EditContactScreen> createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen> {
  late ContactModel? contactModel;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController birthdayController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      contactModel =
          ModalRoute.of(context)!.settings.arguments as ContactModel?;

      if (contactModel != null) {
        firstNameController.text = contactModel!.firstName;
        lastNameController.text = contactModel!.lastName;
        emailController.text = contactModel!.email;
        phoneController.text = contactModel!.phone;
        birthdayController.text = contactModel!.birthdayDate;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 20);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: SvgPicture.asset(Assets.icon.back)),
          actions: [
            IconButton(
                onPressed: () => _saveContact(),
                icon: SvgPicture.asset(Assets.icon.save))
          ],
        ),
        body: BlocListener<ContactBloc, ContactState>(
          listener: (context, state) {
            if (state is ContactListEmptyOperation) {
              Navigator.pop(context);
            }
          },
          child: Form(
              key: _formKey,
              onPopInvoked: (didPop) {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                child: Column(
                  children: [
                    const _ContactAvatar(),
                    const SizedBox(height: 50),
                    TextFormField(
                      controller: firstNameController,
                      decoration: const InputDecoration(hintText: 'First Name'),
                    ),
                    space,
                    TextFormField(
                      controller: lastNameController,
                      decoration: const InputDecoration(hintText: 'Last Name'),
                    ),
                    space,
                    TextFormField(
                      controller: phoneController,
                      decoration: const InputDecoration(hintText: 'Phone'),
                    ),
                    space,
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(hintText: 'Email'),
                    ),
                    space,
                    TextFormField(
                      controller: birthdayController,
                      readOnly: true,
                      decoration: const InputDecoration(hintText: 'Birthday'),
                      onTap: () async {
                        Jalali? picked = await showPersianDatePicker(
                          context: context,
                          initialDate: Jalali.now(),
                          firstDate: Jalali(1300, 1),
                          lastDate: Jalali(1450, 12),
                        );
                        log(picked.toString());
                        birthdayController.text =
                            '${picked!.year}/${picked.month}/${picked.day}';
                        setState(() {});
                      },
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  void _saveContact() {
    if (_formKey.currentState!.validate()) {
      contactModel = ContactModel(
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          phone: phoneController.text.trim(),
          email: emailController.text.trim(),
          birthdayDate: birthdayController.text.trim());

      BlocProvider.of<ContactBloc>(context).add(ContactSaveData(contactModel!));
    }
  }
}

class _ContactAvatar extends StatelessWidget {
  const _ContactAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 180,
        width: 180,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.secondary,
            border: Border.all(
                color: Theme.of(context).colorScheme.surface, width: 1.5)),
        child: SvgPicture.asset(Assets.icon.addPhoto),
      ),
    );
  }
}
