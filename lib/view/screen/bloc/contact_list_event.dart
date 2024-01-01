part of 'contact_list_bloc.dart';

abstract class ContactEvent {}

class ContactLoadData extends ContactEvent {}

class ContactLoadFavorites extends ContactEvent {}

class ContactDeleteData extends ContactEvent {
  final ContactModel contactModel;

  ContactDeleteData(this.contactModel);
}

class ContactSaveData extends ContactEvent {
  final ContactModel contactModel;

  ContactSaveData(this.contactModel);
}
