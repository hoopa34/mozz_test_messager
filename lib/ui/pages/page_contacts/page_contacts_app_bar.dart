import 'package:flutter/material.dart';
import 'package:mozz_test_messenger/ui/theme/app_colors/app_colors.dart';
import 'package:mozz_test_messenger/ui/theme/app_texts/app_text_styles.dart';
import 'package:mozz_test_messenger/ui/theme/app_texts/app_texts.dart';

// Кастомный виджет AppBar для странички контактов
class PageContactsAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  const PageContactsAppBar({super.key})
      : preferredSize = const Size.fromHeight(147);

  @override
  State<PageContactsAppBar> createState() => _PageContactsAppBarState();
}

class _PageContactsAppBarState extends State<PageContactsAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // Основная колонна для виджетов
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
                Text(AppTexts.chats, style: AppTestStyles.chats),
                const SizedBox(height: 6),
                const PageContactsAppBarSearch(),
              ],
            ),
          ),
          Divider(
            color: AppColors.stroke,
            height: 1,
          ),
        ],
      ),
    );
  }
}

// Окно поиска
class PageContactsAppBarSearch extends StatelessWidget {
  const PageContactsAppBarSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        fillColor: AppColors.stroke,
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: AppColors.gray,
        hintText: AppTexts.search,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}
