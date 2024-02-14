import 'package:flutter/material.dart';
import 'package:mozz_test_messenger/ui/pages/page_chat/page_chat_app_bar.dart';
import 'package:mozz_test_messenger/ui/pages/page_chat/page_chat_content.dart';

class PageChat extends StatelessWidget {
  const PageChat({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PageChatAppBar(),
      body: PageChatContent(),
    );
  }
}