import 'package:flutter/material.dart';
import 'package:mozz_test_messenger/ui/theme/app_colors/app_colors.dart';
import 'package:mozz_test_messenger/ui/theme/app_texts/app_text_styles.dart';
import 'package:mozz_test_messenger/ui/theme/app_texts/app_texts.dart';

class PageChatContent extends StatelessWidget {
  const PageChatContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [SizedBox(height: 50), PageChatContentMessenger()],
    );
  }
}

class PageChatContentMessenger extends StatelessWidget {
  const PageChatContentMessenger({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: AppColors.stroke,
          height: 2,
        ),
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
            PageChatContentMessengerButton(icon: Icons.audio_file),
          ],
        )
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
          borderRadius: BorderRadius.all(Radius.circular(12)))
        ),
        fixedSize: const MaterialStatePropertyAll(Size(42, 42))
      ),
      onPressed: action,
      icon: Icon(icon, color: AppColors.black),
    );
  }
}
