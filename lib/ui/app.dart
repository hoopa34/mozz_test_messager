import 'package:flutter/material.dart';
import 'package:mozz_test_messenger/ui/pages/page_contacts/page_contacts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PageContacts(),
    );
  }
}