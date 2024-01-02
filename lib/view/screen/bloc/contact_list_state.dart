part of 'contact_list_bloc.dart';

abstract class ContactState {}

class ContactListLoading extends ContactState {}

class ContactListEmptyState extends ContactState {}

class ContactListAllDataSuccess extends ContactState {
  final List<ContactModel> contactList;

  ContactListAllDataSuccess(this.contactList);
}

class ContactListFavoritesSuccess extends ContactState {
  final List<ContactModel> contactList;

  ContactListFavoritesSuccess(this.contactList);
}

class ContactListSuccessOperation extends ContactState {
  final ContactModel contact;

  ContactListSuccessOperation(this.contact);
}
