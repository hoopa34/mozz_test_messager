import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mozz_test_messenger/domain/bloc/contacts_bloc/contacts_bloc.dart';
import 'package:mozz_test_messenger/domain/bloc/messenger_bloc/messenger_bloc.dart';
import 'package:mozz_test_messenger/ui/theme/app_colors/app_colors.dart';
import 'package:mozz_test_messenger/ui/theme/app_texts/app_text_styles.dart';
import 'package:mozz_test_messenger/ui/theme/app_texts/app_texts.dart';

class PageChatMessenger extends StatelessWidget {
  final int accountId;
  const PageChatMessenger({
    super.key,
    required this.accountId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: AppColors.stroke,
          height: 2,
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Добавление изображения
            const PageChatContentMessengerButton(icon: Icons.attach_file),
            // Набор текста
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                height: 42,
                child: TextField(
                  onSubmitted: (message) {
                    context.read<MessengerBloc>().add(
                          MessengerAddMessageEvent(
                            accountId: accountId,
                            message: message,
                          ),
                        );
                    context.read<ContactsBloc>().add(const ContactsLoadEvent());
                  },
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    fillColor: AppColors.stroke,
                    hintText: AppTexts.message,
                    hintStyle: AppTestStyles.search,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
              ),
            ),
            // Голосовое сообщение
            const PageChatContentMessengerButton(icon: Icons.audio_file),
          ],
        ),
        const SizedBox(height: 14),
      ],
    );
  }
}

class PageChatContentMessengerButton extends StatelessWidget {
  final IconData icon;
  final void Function()? action;
  const PageChatContentMessengerButton({
    super.key,
    this.icon = Icons.abc,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColors.stroke),
          shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
          fixedSize: const MaterialStatePropertyAll(Size(42, 42))),
      onPressed: action,
      icon: Icon(icon, color: AppColors.black),
    );
  }
}
