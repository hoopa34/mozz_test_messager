import 'package:flutter/material.dart';
import 'package:mozz_test_messenger/domain/hive/messenger_item_type.dart';
import 'package:mozz_test_messenger/ui/pages/page_chat/page_chat_messenger.dart';
import 'package:mozz_test_messenger/ui/theme/app_colors/app_colors.dart';
import 'package:mozz_test_messenger/ui/theme/app_texts/app_text_styles.dart';
import 'package:mozz_test_messenger/ui/widgets/message_widget/message_widget.dart';

class PageChatContent extends StatelessWidget {
  final List<MessageItemType> messages;
  const PageChatContent({
    super.key,
    required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageChatContetnMessages(messages: messages),
        const PageChatMessenger(),
      ],
    );
  }
}

class PageChatContetnMessages extends StatelessWidget {
  final List<MessageItemType> messages;
  const PageChatContetnMessages({
    super.key,
    required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          MessageItemType currentMessage = messages[index];
          // Первое сообщение
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MessageWidget(
                  isUser: currentMessage.isUser,
                  text: currentMessage.message,
                ),
                const SizedBox(height: 30),
              ],
            );
          }
          // Сообщение со сменой времени
          if (currentMessage.messageDate.day ==
              messages[index + 1].messageDate.day) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PageChatContentDateSeparator(date: currentMessage.messageDate),
                const SizedBox(height: 20),
                MessageWidget(
                  isUser: currentMessage.isUser,
                  text: currentMessage.message,
                ),
              ],
            );
          }
          // Обычное сообщение
          return MessageWidget(
            isUser: currentMessage.isUser,
            text: currentMessage.message,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: messages.length,
        reverse: true,
      ),
    );
  }
}

class PageChatContentDateSeparator extends StatelessWidget {
  final DateTime date;
  const PageChatContentDateSeparator({
    super.key,
    required this.date,
  });

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
          '${date.day}.${date.month}.${date.year}',
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
