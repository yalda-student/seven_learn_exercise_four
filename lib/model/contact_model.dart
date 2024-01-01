import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'contact_model.g.dart';

@HiveType(typeId: 0)
class ContactModel {
  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String lastName;
  @HiveField(2, defaultValue: '')
  final String? email;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  final Uint8List? avatar;

  ContactModel(
      {required this.firstName,
      required this.lastName,
      this.email,
      required this.phone,
      this.avatar});

  @override
  String toString() {
    return 'ContactModel{firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, avatar: $avatar}';
  }
}
