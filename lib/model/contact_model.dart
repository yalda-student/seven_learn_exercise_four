import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'contact_model.g.dart';

@HiveType(typeId: 0)
class ContactModel extends HiveObject {
  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String lastName;
  @HiveField(2, defaultValue: '')
  final String email;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  final Uint8List? avatar;
  @HiveField(5, defaultValue: false)
  bool isFavorite = false;
  @HiveField(6)
  final String birthdayDate;

  ContactModel(
      {required this.firstName,
      required this.lastName,
      required this.phone,
      required this.birthdayDate,
      required this.email,
      this.avatar});

  @override
  String toString() {
    return 'ContactModel{firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, avatar: $avatar, isFavorite: $isFavorite}';
  }
}
