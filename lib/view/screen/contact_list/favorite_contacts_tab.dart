import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_learn_exercise_four/view/screen/bloc/contact_list_bloc.dart';
import 'package:seven_learn_exercise_four/view/widget/contact_item.dart';
import 'package:seven_learn_exercise_four/view/widget/empty_state.dart';

class FavoriteContactTab extends StatelessWidget {
  const FavoriteContactTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
        bloc: BlocProvider.of<ContactBloc>(context)
          ..add(ContactLoadFavorites()),
        buildWhen: (previous, current) =>
            current is! ContactListSuccessOperation,
        builder: (context, state) {
          if (state is ContactListFavoritesSuccess) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 8),
              itemCount: state.contactList.length,
              itemBuilder: (context, index) =>
                  ContactItem(contact: state.contactList[index]),
              separatorBuilder: (context, index) => Divider(
                color: Theme.of(context).colorScheme.surface,
                indent: 20,
                endIndent: 20,
              ),
            );
          }
          return const Center(child: EmptyState());
        });
  }
}
