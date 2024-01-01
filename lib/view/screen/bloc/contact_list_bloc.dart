import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:seven_learn_exercise_four/main.dart';
import 'package:seven_learn_exercise_four/model/contact_model.dart';

part 'contact_list_event.dart';
part 'contact_list_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final box = Hive.box<ContactModel>(contactBox);

  ContactBloc() : super(ContactListLoading()) {
    on<ContactEvent>((event, emit) async {
      if (event is ContactLoadData) {
        emit(ContactListLoading());

        final contactList = box.values.toList();
        if (contactList.isEmpty) {
          emit(ContactListEmptyState());
        } else {
          emit(ContactListAllDataSuccess(contactList));
        }
      } else if (event is ContactSaveData) {
        if (event.contactModel.isInBox) {
          await event.contactModel.save();
        } else {
          await box.add(event.contactModel);
        }
        emit(ContactListEmptyOperation());
      } else if (event is ContactDeleteData) {
        await box.delete(event.contactModel.key);
        emit(ContactListEmptyOperation());
      }
    });
  }
}
