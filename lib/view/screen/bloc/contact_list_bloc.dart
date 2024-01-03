import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:seven_learn_exercise_four/main.dart';
import 'package:seven_learn_exercise_four/model/contact_model.dart';

part 'contact_list_event.dart';
part 'contact_list_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final box = Hive.box<ContactModel>(contactBox);

  List<ContactModel> _contactList = [];

  ContactBloc() : super(ContactListLoading()) {
    on<ContactEvent>((event, emit) async {
      if (event is ContactLoadData) {
        emit(ContactListLoading());

        _getAllContacts(emit);
      } else if (event is ContactLoadFavorites) {
        final contacts =
            box.values.where((element) => element.isFavorite).toList();
        if (contacts.isEmpty) {
          emit(ContactListEmptyState());
        } else {
          emit(ContactListFavoritesSuccess(contacts));
        }
      } else if (event is ContactSaveData) {
        if (event.contactModel.isInBox) {
          await event.contactModel.save();
          final int index = _contactList.indexOf(event.contactModel);
          _contactList[index] = event.contactModel;
          emit(ContactListAllDataSuccess(_contactList));
          emit(ContactListSuccessOperation(event.contactModel));
        } else {
          await box.add(event.contactModel);
          _contactList.add(event.contactModel);
          emit(ContactListAllDataSuccess(box.values.toList()));
        }
      } else if (event is ContactDeleteData) {
        await box.delete(event.contactModel.key);
        _getAllContacts(emit);
      }
    });
  }

  void _getAllContacts(Emitter<ContactState> emit) {
    _contactList = box.values.toList();
    if (_contactList.isEmpty) {
      emit(ContactListEmptyState());
    } else {
      emit(ContactListAllDataSuccess(_contactList));
    }
  }
}
