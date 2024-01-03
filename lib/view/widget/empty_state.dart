import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seven_learn_exercise_four/gen/assets.gen.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.icon.corrupted,
          width: 150,
        ),
        const Text(
          'No Contact !',
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
