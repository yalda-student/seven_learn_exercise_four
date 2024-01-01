import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seven_learn_exercise_four/gen/assets.gen.dart';

class ContactDetailScreen extends StatelessWidget {
  const ContactDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(Assets.icon.back)),
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.icon.save))
        ],
      ),
    );
  }
}
