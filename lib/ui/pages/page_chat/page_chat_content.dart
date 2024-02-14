import 'package:flutter/material.dart';
import 'package:mozz_test_messenger/ui/pages/page_chat/page_chat_messenger.dart';
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
          if (index == 0) {
            return const SizedBox(height: 30);
          }
          return const MessageWidget(
            isUser: true,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: 100,
        reverse: true,
      ),
    );
  }
}