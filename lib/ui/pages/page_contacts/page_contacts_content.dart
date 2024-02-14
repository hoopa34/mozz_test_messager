import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mozz_test_messenger/ui/theme/app_colors/app_colors.dart';
import 'package:mozz_test_messenger/ui/theme/app_colors/app_gradients.dart';
import 'package:mozz_test_messenger/ui/theme/app_texts/app_text_styles.dart';
import 'package:mozz_test_messenger/ui/theme/app_texts/app_texts.dart';

// Контент страницы контактов
class PageContactsContent extends StatelessWidget {
  const PageContactsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) => const PageContactsContentContact(),
      itemCount: 4,
    );
  }
}

// Кнопка выбора чата
class PageContactsContentContact extends StatelessWidget {
  const PageContactsContentContact({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  PageContactsContentContactProfile(),
                  SizedBox(width: 12),
                  PageContactsContentContactTitle(),
                  Spacer(),
                  PageContactsContentContactDate(),
                ],
              ),
            ),
            Divider(
              color: AppColors.stroke,
              height: 2,
            )
          ],
        ),
      ),
    );
  }
}

// Аватар пользователя
class PageContactsContentContactProfile extends StatelessWidget {
  const PageContactsContentContactProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Gradient randomGradient() {
      try {
        int length = AppGradients.allGradients.length;
        int random = Random().nextInt(length);
        return AppGradients.allGradients[random];
      } catch (e) {
        return const LinearGradient(
          colors: [
            Colors.amber,
            Colors.red,
          ],
        );
      }
    }

    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(34),
      ),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(gradient: randomGradient()),
        child: Center(
          child: Text(
            'ВВ',
            style: AppTestStyles.profileAvatar,
          ),
        ),
      ),
    );
  }
}

// Внутренний контент выбора пользователя
class PageContactsContentContactTitle extends StatelessWidget {
  final bool isUser;
  const PageContactsContentContactTitle({
    super.key,
    this.isUser = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Виктор Власов', style: AppTestStyles.profileTitle),
        isUser
            ? Row(
                children: [
                  Text(AppTexts.you, style: AppTestStyles.profileYou),
                  const SizedBox(width: 4),
                  Text('Я вышел', style: AppTestStyles.profileMessage),
                ],
              )
            : Text('Я готов', style: AppTestStyles.profileMessage),
      ],
    );
  }
}

class PageContactsContentContactDate extends StatelessWidget {
  const PageContactsContentContactDate({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Text('01.01.1999', style: AppTestStyles.profileMessage,)
      ),
    );
  }
}
