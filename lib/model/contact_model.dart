import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'contact_model.g.dart';

@HiveType(typeId: 0)
class ContactModel extends HiveObject {
  @HiveField(0)
  String firstName;
  @HiveField(1)
  String lastName;
  @HiveField(2, defaultValue: '')
  String email;
  @HiveField(3)
  String phone;
  @HiveField(4)
  Uint8List? avatar;
  @HiveField(5, defaultValue: false)
  bool isFavorite = false;
  @HiveField(6)
  String birthdayDate;

  ContactModel(
      {required this.firstName,
      required this.lastName,
      required this.phone,
      required this.birthdayDate,
      required this.email,
      this.avatar});

  @override
  String toString() {
    return 'ContactModel{firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, avatar: ${avatar!.length}, isFavorite: $isFavorite}';
  }
}
