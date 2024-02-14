import 'package:flutter/material.dart';

class PageContacts extends StatelessWidget {
  const PageContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PageContactsAppBar(),
    );
  }
}

class PageContactsAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  const PageContactsAppBar({super.key})
      : preferredSize = const Size.fromHeight(60);

  @override
  State<PageContactsAppBar> createState() => _PageContactsAppBarState();
}

class _PageContactsAppBarState extends State<PageContactsAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Column(
        children: [
          Divider(),
        ],
      ),
    );
  }
}
