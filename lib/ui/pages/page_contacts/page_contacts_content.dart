import 'package:flutter/material.dart';
import 'package:mozz_test_messenger/domain/bloc/contacts_bloc/contacts_bloc.dart';
import 'package:mozz_test_messenger/ui/pages/page_chat/page_chat.dart';
import 'package:mozz_test_messenger/ui/theme/app_colors/app_colors.dart';
import 'package:mozz_test_messenger/ui/theme/app_texts/app_text_styles.dart';
import 'package:mozz_test_messenger/ui/theme/app_texts/app_texts.dart';
import 'package:mozz_test_messenger/ui/widgets/user_avatar/user_avatar.dart';

// Контент страницы контактов
class PageContactsContent extends StatelessWidget {
  final List<Contacts> contacts;
  const PageContactsContent({
    super.key,
    required this.contacts,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) => PageContactsContentContact(
        contact: contacts[index],
      ),
      itemCount: contacts.length,
    );
  }
}

// Кнопка выбора чата
class PageContactsContentContact extends StatelessWidget {
  final Contacts contact;
  const PageContactsContentContact({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PageChat(
              accountId: contact.accountId,
            ),
          ),
        );
      },
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        shape: const MaterialStatePropertyAll(RoundedRectangleBorder()),
        overlayColor: MaterialStatePropertyAll(AppColors.stroke),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                UserAvatar(data: contact.accountName),
                const SizedBox(width: 12),
                PageContactsContentContactTitle(
                  accountName: contact.accountName,
                  lastMessage: contact.lastMessage.message,
                  isUser: contact.lastMessage.isUser,
                ),
                const Spacer(),
                PageContactsContentContactDate(
                  lastTimeOnline: contact.lastTimeOnline,
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.stroke,
            height: 2,
          )
        ],
      ),
    );
  }
}

// Внутренний контент выбора пользователя
class PageContactsContentContactTitle extends StatelessWidget {
  final bool isUser;
  final String accountName;
  final String lastMessage;

  const PageContactsContentContactTitle({
    super.key,
    this.isUser = true,
    required this.accountName,
    required this.lastMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(accountName, style: AppTestStyles.profileTitle),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.45,
          child: isUser
              ? Row(
                  children: [
                    Text(AppTexts.you, style: AppTestStyles.profileYou),
                    const SizedBox(width: 4),
                    Text(
                      lastMessage,
                      style: AppTestStyles.profileMessage,
                      maxLines: 1,
                    ),
                  ],
                )
              : Text(
                  lastMessage,
                  style: AppTestStyles.profileMessage,
                  maxLines: 1,
                ),
        ),
      ],
    );
  }
}

class PageContactsContentContactDate extends StatelessWidget {
  final DateTime lastTimeOnline;
  const PageContactsContentContactDate({
    super.key,
    required this.lastTimeOnline,
  });

  @override
  Widget build(BuildContext context) {
    String datePicker() {
      DateTime currentTime = DateTime.now();
      String output = '01.01.1999';

      if (currentTime.year != lastTimeOnline.year) {
        output =
            '${lastTimeOnline.day}.${lastTimeOnline.month}.${lastTimeOnline.year}';
      }
      if (currentTime.month != lastTimeOnline.month) {
        output =
            '${lastTimeOnline.day}.${lastTimeOnline.month}.${lastTimeOnline.year}';
      }
      if (currentTime.day - 1 == lastTimeOnline.day) {
        output = 'Вчера';
      }
      if (currentTime.day != lastTimeOnline.day) {
        output = '${lastTimeOnline.day - currentTime.day} дня назад';
      }
      if (currentTime.minute != lastTimeOnline.minute) {
        output = '${lastTimeOnline.hour}:${lastTimeOnline.minute}';
      }
      if (currentTime.minute - 15 <= lastTimeOnline.minute) {
        output = '${currentTime.minute - lastTimeOnline.minute} минуты назад';
      }
      if (currentTime == lastTimeOnline) {
        output = 'Онлайн';
      }

      return output;
    }

    return SizedBox(
      height: 50,
      child: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            datePicker(),
            textAlign: TextAlign.end,
            style: AppTestStyles.profileMessage,
          )),
    );
  }
}
