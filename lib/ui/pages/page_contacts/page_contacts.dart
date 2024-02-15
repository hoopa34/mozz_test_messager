import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mozz_test_messenger/domain/bloc/contacts_bloc/contacts_bloc.dart';
import 'package:mozz_test_messenger/ui/pages/page_contacts/page_contacts_app_bar.dart';
import 'package:mozz_test_messenger/ui/pages/page_contacts/page_contacts_content.dart';

// Страница контактов
class PageContacts extends StatelessWidget {
  const PageContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc, ContactsState>(
      builder: (context, state) {
        if (state is! ContactsLoaded) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          appBar: const PageContactsAppBar(),
          body: PageContactsContent(contacts: state.allContacts),
        );
      },
    );
  }
}
