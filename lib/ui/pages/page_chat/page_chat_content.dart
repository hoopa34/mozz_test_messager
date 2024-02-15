import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mozz_test_messenger/domain/bloc/messenger_bloc/messenger_bloc.dart';
import 'package:mozz_test_messenger/domain/hive/messenger_item_type.dart';
import 'package:mozz_test_messenger/ui/pages/page_chat/page_chat_messenger.dart';
import 'package:mozz_test_messenger/ui/theme/app_colors/app_colors.dart';
import 'package:mozz_test_messenger/ui/theme/app_texts/app_text_styles.dart';
import 'package:mozz_test_messenger/ui/theme/app_texts/app_texts.dart';
import 'package:mozz_test_messenger/ui/widgets/message_widget/message_widget.dart';

class PageChatContent extends StatelessWidget {
  final int accountId;
  const PageChatContent({
    super.key,
    required this.accountId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageChatContetnMessages(),
        PageChatMessenger(accountId: accountId),
      ],
    );
  }
}

class PageChatContetnMessages extends StatelessWidget {
  const PageChatContetnMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessengerBloc, MessengerState>(
      builder: (context, state) {
        if (state is! MessengerLoaded) {
          return const Center(child: CircularProgressIndicator());
        }
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => MessageWidget(
              isUser: state.item.allMessages[index].isUser,
              text: state.item.allMessages[index].message,
              time: state.item.allMessages[index].messageDate,
              isWatched: state.item.allMessages[index].isWatched,
            ),
            itemBuilder: (context, index) => Separator(
              index: index,
              last: state.item.allMessages.length-1,
              date: state.item.allMessages[index == 0 ? 0 : index - 1].messageDate,
            ),
            itemCount: state.item.allMessages.length + 1,
            reverse: true,
          ),
        );
      },
    );
  }
}

class Separator extends StatelessWidget {
  final int index;
  final int last;
  final DateTime date;
  const Separator({
    super.key,
    required this.index,
    required this.last,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    Widget widget = const SizedBox(height: 20);

    if (index - 1 == last){
      widget = Column(
        children: [
          PageChatContentDateSeparator(date: date),
          const SizedBox(height: 20),
        ],
      );
    }

    if(date.day == DateTime.now().day){
      widget = Column(
        children: [
          const SizedBox(height: 20),
          PageChatContentDateSeparator(date: date),
          const SizedBox(height: 20),
        ],
      );
    }

    if (index == 0) {
      widget = const SizedBox(height: 30);
    }

    return widget;
  }
}

// Сепаратор
class PageChatContentDateSeparator extends StatelessWidget {
  final DateTime date;
  const PageChatContentDateSeparator({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    String datePicker() {
      DateTime now = DateTime.now();
      int lastDay = date.year + date.month + date.day;
      int today = now.year + now.month + now.day;
      if (lastDay == today) {
        return AppTexts.today;
      }
      return '${date.day}.${date.month}.${date.year}';
    }

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
          datePicker(),
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
