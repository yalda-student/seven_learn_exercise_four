import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seven_learn_exercise_four/gen/assets.gen.dart';
import 'package:seven_learn_exercise_four/model/contact_model.dart';
import 'package:seven_learn_exercise_four/view/screen/bloc/contact_list_bloc.dart';
import 'package:seven_learn_exercise_four/view/screen/contact_avatar.dart';
import 'package:seven_learn_exercise_four/view/screen/edit_contact_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailScreen extends StatefulWidget {
  const ContactDetailScreen({super.key});

  @override
  State<ContactDetailScreen> createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {
  late ContactModel contactModel;

  @override
  Widget build(BuildContext context) {
    contactModel = ModalRoute.of(context)!.settings.arguments as ContactModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: SvgPicture.asset(Assets.icon.back)),
          actions: [
            _FavoriteButton(contactModel: contactModel),
            PopupMenuButton(
              onSelected: (value) {
                if (value == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditContactScreen(),
                          settings: RouteSettings(arguments: contactModel)));
                } else if (value == 2) {
                  BlocProvider.of<ContactBloc>(context)
                      .add(ContactDeleteData(contactModel));
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: 1, child: Text('Edit')),
                const PopupMenuItem(value: 2, child: Text('Delete')),
              ],
            ),
          ],
        ),
        body: BlocListener<ContactBloc, ContactState>(
          listenWhen: (previous, current) =>
              current is ContactListSuccessOperation,
          listener: (context, state) => Navigator.of(context).pop(),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            children: [
              ContactAvatar(
                  avatarImageData: contactModel.avatar,
                  placeholder: const SizedBox()),
              const SizedBox(height: 20),
              Text(
                '${contactModel.firstName} ${contactModel.lastName}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 20),
              _ContactActions(contactModel: contactModel),
              _ContactDetail(contactModel: contactModel),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactActions extends StatelessWidget {
  const _ContactActions({required this.contactModel});

  final ContactModel contactModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: () async {
              Uri sms = Uri.parse('mail:${contactModel.phone}?body=');
              var launcher = await launchUrl(sms);
              if (!launcher) {
                throw 'Could not launch ${contactModel.phone}';
              }
            },
            icon: SvgPicture.asset(Assets.icon.message)),
        IconButton(
            onPressed: () async {
              Uri phone = Uri.parse('tel:${contactModel.phone}');
              var launcher = await launchUrl(phone);
              if (!launcher) {
                throw 'Could not launch ${contactModel.phone}';
              }
            },
            icon: SvgPicture.asset(Assets.icon.circularCall)),
        IconButton(
            onPressed: () async {
              Uri mail = Uri.parse('mailto:${contactModel.email}');
              var launcher = await launchUrl(mail);
              if (!launcher) {
                throw 'Could not launch ${contactModel.phone}';
              }
            },
            icon: SvgPicture.asset(Assets.icon.circularEmail)),
      ],
    );
  }
}

class _FavoriteButton extends StatefulWidget {
  const _FavoriteButton({required this.contactModel});

  final ContactModel contactModel;

  @override
  State<_FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<_FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          widget.contactModel.isFavorite = !widget.contactModel.isFavorite;
          BlocProvider.of<ContactBloc>(context)
              .add(ContactSaveData(widget.contactModel));
          setState(() {});
        },
        icon: SvgPicture.asset(widget.contactModel.isFavorite
            ? Assets.icon.favorite
            : Assets.icon.unfavorite));
  }
}

class _ContactDetail extends StatelessWidget {
  const _ContactDetail({required this.contactModel});

  final ContactModel contactModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        children: [
          _ContactDetailItem(
              info: contactModel.phone,
              icon: SvgPicture.asset(Assets.icon.call)),
          _ContactDetailItem(
              info: contactModel.birthdayDate,
              icon: SvgPicture.asset(Assets.icon.calender)),
          _ContactDetailItem(
              info: contactModel.email,
              icon: SvgPicture.asset(Assets.icon.email)),
        ],
      ),
    );
  }
}

class _ContactDetailItem extends StatelessWidget {
  const _ContactDetailItem({required this.info, required this.icon});

  final Widget icon;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Text(
            info,
            style: const TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }
}
