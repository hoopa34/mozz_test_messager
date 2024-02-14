import 'package:flutter/material.dart';
import 'package:mozz_test_messenger/ui/theme/app_colors/app_colors.dart';

class MessageWidget extends StatelessWidget {
  final bool isUser;
  const MessageWidget({super.key, this.isUser = true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: isUser ? Alignment.bottomRight : Alignment.bottomLeft,
      children: [
        // Блок сообщения
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isUser ? AppColors.green : AppColors.stroke,
              borderRadius: BorderRadiusDirectional.only(
                topStart: const Radius.circular(21),
                topEnd: const Radius.circular(21),
                bottomStart: isUser ? const Radius.circular(21) : Radius.zero,
                bottomEnd: isUser ? Radius.zero : const Radius.circular(21),
              ),
            ),
            child: const Text('123'),
          ),
        ),
        // Блок хвоста сообщения
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 1,
          ),
          child: Container(
            width: 10,
            height: 21,
            color: isUser ? AppColors.green : AppColors.stroke,
          ),
        ),
        // Блок обрезки хвоста сообщения
        Container(
          width: 11,
          height: 22,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.only(
              bottomLeft: isUser ? const Radius.circular(21) : Radius.zero,
              bottomRight: isUser ? Radius.zero : const Radius.circular(21),
            ),
          ),
        ),
      ],
    );
  }
}
