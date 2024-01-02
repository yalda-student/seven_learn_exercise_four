import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seven_learn_exercise_four/gen/assets.gen.dart';
import 'package:seven_learn_exercise_four/gen/fonts.gen.dart';
import 'package:seven_learn_exercise_four/view/screen/contact_list/all_contacts_tab.dart';
import 'package:seven_learn_exercise_four/view/screen/contact_list/favorite_contacts_tab.dart';
import 'package:seven_learn_exercise_four/view/screen/edit_contact_screen.dart';

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Contacts'),
            bottom: TabBar(
              tabs: const [Text('All'), Text('Favorites')],
              indicatorSize: TabBarIndicatorSize.tab,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              labelStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: FontFamily.comicSans,
                  fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(
                  fontSize: 17,
                  color: Theme.of(context).colorScheme.secondary,
                  fontFamily: FontFamily.comicSans,
                  fontWeight: FontWeight.normal),
              indicator: UnderlineTabIndicator(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2,
                  )),
            ),
          ),
          body: const TabBarView(
              children: [AllContactTab(), FavoriteContactTab()]),
          floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: Theme.of(context).colorScheme.surface,
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const EditContactScreen())),
              child: SvgPicture.asset(Assets.icon.contact)),
        ),
      ),
    );
  }
}
