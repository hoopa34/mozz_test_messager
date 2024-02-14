import 'package:flutter/material.dart';
import 'package:mozz_test_messenger/ui/pages/page_chat/page_chat_messenger.dart';

class PageChatContent extends StatelessWidget {
  const PageChatContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(height: 50),
        PageChatMessenger(),
      ],
    );
  }
}
