import 'package:flutter/material.dart';
import 'package:mozz_test_messenger/ui/theme/app_colors/app_colors.dart';
import 'package:mozz_test_messenger/ui/theme/app_texts/app_text_styles.dart';
import 'package:mozz_test_messenger/ui/widgets/user_avatar/user_avatar.dart';

class PageChatAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  const PageChatAppBar({super.key})
      : preferredSize = const Size.fromHeight(76);

  @override
  State<PageChatAppBar> createState() => _PageChatAppBarState();
}

class _PageChatAppBarState extends State<PageChatAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 20),
              // Кнопка выхода
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(width: 6),
              const UserAvatar(),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Виктор Власов', style: AppTestStyles.profileTitle,),
                  Text('В сети', style: AppTestStyles.profileMessage,),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(color: AppColors.stroke, height: 2)
        ],
      ),
    );
  }
}
