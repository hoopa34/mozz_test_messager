import 'package:flutter/material.dart';
import 'package:mozz_test_messenger/ui/pages/page_chat/page_chat_messenger.dart';
import 'package:mozz_test_messenger/ui/theme/app_colors/app_colors.dart';
import 'package:mozz_test_messenger/ui/theme/app_texts/app_text_styles.dart';
import 'package:mozz_test_messenger/ui/widgets/message_widget/message_widget.dart';

class PageChatContent extends StatelessWidget {
  const PageChatContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PageChatContetnMessages(),
        PageChatMessenger(),
      ],
    );
  }
}

class PageChatContetnMessages extends StatelessWidget {
  const PageChatContetnMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          // Первое сообщение
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MessageWidget(
                  isUser: true,
                  text: '$index',
                ),
                const SizedBox(height: 30),
              ],
            );
          }
          if (index % 3 == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const PageChatContentDateSeparator(),
                const SizedBox(height: 20),
                MessageWidget(
                  isUser: false,
                  text: '$index',
                ),
              ],
            );
          }
          // Обычное сообщение
          return MessageWidget(
            isUser: false,
            text: '$index',
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: 100,
        reverse: true,
      ),
    );
  }
}

class PageChatContentDateSeparator extends StatelessWidget {
  const PageChatContentDateSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 6),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.35,
          ),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.gray, width: 0.5)),
        ),
        Text(
          '10.10.1999',
          style: AppTestStyles.date,
        ),
        Container(
          margin: const EdgeInsets.only(right: 6),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.35,
          ),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.gray, width: 0.5)),
        ),
      ],
    );
  }
}
