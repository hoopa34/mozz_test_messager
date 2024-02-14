import 'package:flutter/material.dart';
import 'package:mozz_test_messenger/ui/pages/page_contacts/page_contacts_app_bar.dart';
import 'package:mozz_test_messenger/ui/pages/page_contacts/page_contacts_content.dart';

// Страница контактов
class PageContacts extends StatelessWidget {
  const PageContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PageContactsAppBar(),
      body: PageContactsContent(),
    );
  }
}