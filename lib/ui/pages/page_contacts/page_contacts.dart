import 'package:flutter/material.dart';
import 'package:mozz_test_messenger/ui/theme/app_colors/app_colors.dart';
import 'package:mozz_test_messenger/ui/theme/app_texts/app_texts.dart';

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
      child: Column(
        // Основная колонна для виджетов
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            // Чаты и поиск
            padding: const EdgeInsets.only(
              top: 14,
              left: 20,
              right: 20,
              bottom: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppTexts.chats),
                const SizedBox(height: 6),
                Container(),
              ],
            ),
          ),
          Divider(color: AppColors.stroke),
        ],
      ),
    );
  }
}
