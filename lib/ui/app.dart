import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mozz_test_messenger/domain/messenger_bloc/messenger_bloc.dart';
import 'package:mozz_test_messenger/ui/pages/page_contacts/page_contacts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessengerBloc(),
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Gilroy'),
        home: const PageContacts(),
      ),
    );
  }
}
