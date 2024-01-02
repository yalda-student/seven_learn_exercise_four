import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:seven_learn_exercise_four/gen/assets.gen.dart';
import 'package:seven_learn_exercise_four/model/contact_model.dart';
import 'package:seven_learn_exercise_four/view/screen/bloc/contact_list_bloc.dart';
import 'package:seven_learn_exercise_four/view/widget/contact_avatar.dart';

Uint8List? avatarImageData;

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
        log(contactModel!.toString());
        log(contactModel!.avatar!.length.toString());
        avatarImageData = Uint8List.fromList(contactModel!.avatar!);
        log(avatarImageData!.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 20);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
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
        body: Form(
            key: _formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              children: [
                const _AvatarPicker(),
                const SizedBox(height: 50),
                TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(hintText: 'First Name'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Fill first name';
                    }
                    return null;
                  },
                ),
                space,
                TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(hintText: 'Last Name'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
                space,
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(hintText: 'Phone'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
                space,
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
                space,
                _DatePicker(
                  textController: birthdayController,
                ),
              ],
            )),
      ),
    );
  }

  void _saveContact() {
    if (_formKey.currentState!.validate()) {
      if (contactModel == null) {
        contactModel = ContactModel(
            firstName: firstNameController.text.trim(),
            lastName: lastNameController.text.trim(),
            phone: phoneController.text.trim(),
            email: emailController.text.trim(),
            avatar: avatarImageData,
            birthdayDate: birthdayController.text.trim());
      } else {
        contactModel!.firstName = firstNameController.text.trim();
        contactModel!.lastName = lastNameController.text.trim();
        contactModel!.phone = phoneController.text.trim();
        contactModel!.email = emailController.text.trim();
        contactModel!.birthdayDate = birthdayController.text.trim();
        if (avatarImageData != null) {
          contactModel!.avatar = avatarImageData;
        }
      }

      BlocProvider.of<ContactBloc>(context).add(ContactSaveData(contactModel!));
      Navigator.pop(context);
    }
  }
}

class _DatePicker extends StatefulWidget {
  const _DatePicker({required this.textController});

  final TextEditingController textController;

  @override
  State<_DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<_DatePicker> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      readOnly: true,
      decoration: const InputDecoration(hintText: 'Birthday'),
      onTap: () async {
        Jalali? picked = await showPersianDatePicker(
          context: context,
          initialDate: Jalali.now(),
          firstDate: Jalali(1300, 1),
          lastDate: Jalali(1450, 12),
        );
        if (picked != null) {
          widget.textController.text =
              '${picked.year}/${picked.month}/${picked.day}';
          setState(() {});
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return '';
        }
        return null;
      },
    );
  }
}

class _AvatarPicker extends StatefulWidget {
  const _AvatarPicker();

  @override
  State<_AvatarPicker> createState() => _AvatarPickerState();
}

class _AvatarPickerState extends State<_AvatarPicker> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final ImagePicker picker = ImagePicker();
        final XFile? image = await picker.pickImage(source: ImageSource.camera);
        if (image != null) {
          avatarImageData = Uint8List.fromList(await image.readAsBytes());
          setState(() {});
        }
      },
      child: ContactAvatar(
          avatarImageData: avatarImageData,
          placeholder: SvgPicture.asset(Assets.icon.addPhoto)),
    );
  }
}
