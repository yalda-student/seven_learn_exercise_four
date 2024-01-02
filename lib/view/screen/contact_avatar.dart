import 'dart:typed_data';

import 'package:flutter/material.dart';

class ContactAvatar extends StatelessWidget {
  const ContactAvatar(
      {super.key, required this.avatarImageData, required this.placeholder});

  final Uint8List? avatarImageData;
  final Widget placeholder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.secondary,
          border: Border.all(
              color: Theme.of(context).colorScheme.surface, width: 1.5),
          image: avatarImageData != null
              ? DecorationImage(
                  image: MemoryImage(avatarImageData!), fit: BoxFit.cover)
              : null),
      child: avatarImageData == null ? placeholder : null,
    );
  }
}
