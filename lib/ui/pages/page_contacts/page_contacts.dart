import 'package:flutter/material.dart';
import 'package:mozz_test_messenger/ui/theme/app_colors/app_colors.dart';

  // Страница контактов
class PageContacts extends StatelessWidget {
  const PageContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PageContactsAppBar(),
    );
  }
}

  // Кастомный виджет AppBar для странички контактов
class PageContactsAppBar extends StatefulWidget implements PreferredSizeWidget { 
  @override
  final Size preferredSize;
  const PageContactsAppBar({super.key})
      : preferredSize = const Size.fromHeight(169);

  @override
  State<PageContactsAppBar> createState() => _PageContactsAppBarState();
}

class _PageContactsAppBarState extends State<PageContactsAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column( // Основная колонна для виджетов
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Padding( // Чаты и поиск
            padding: EdgeInsets.only(
              top: 14,
              left: 20,
              right: 20,
              bottom: 24,
            ),
            child: Column(),
          ),
          Divider(color: AppColors.stroke),
        ],
      ),
    );
  }
}
