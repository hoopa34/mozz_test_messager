import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mozz_test_messenger/domain/bloc/contacts_bloc/contacts_bloc.dart';
import 'package:mozz_test_messenger/domain/bloc/messenger_bloc/messenger_bloc.dart';
import 'package:mozz_test_messenger/ui/pages/page_contacts/page_contacts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MessengerBloc>(
          create: (context) => MessengerBloc()
            ..add(
              const MessengerLoadEvent(accountId: 0),
            ),
        ),
        BlocProvider<ContactsBloc>(
          create: (context) => ContactsBloc()
            ..add(
              const ContactsLoadEvent(),
            ),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Gilroy'),
        home: const PageContacts(),
      ),
    );
  }
}
