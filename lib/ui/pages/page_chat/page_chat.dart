import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mozz_test_messenger/domain/bloc/messenger_bloc/messenger_bloc.dart';
import 'package:mozz_test_messenger/ui/pages/page_chat/page_chat_app_bar.dart';
import 'package:mozz_test_messenger/ui/pages/page_chat/page_chat_content.dart';

class PageChat extends StatelessWidget {
  final int accountId;
  const PageChat({
    super.key,
    required this.accountId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessengerBloc, MessengerState>(
      builder: (context, state) {
        context
            .read<MessengerBloc>()
            .add(MessengerLoadEvent(accountId: accountId));
        if (state is! MessengerLoaded) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          appBar: PageChatAppBar(
            accountName: state.item.accountName,
            isOnline: state.item.isOnline,
          ),
          body: PageChatContent(
            accountId: accountId,
          ),
        );
      },
    );
  }
}
