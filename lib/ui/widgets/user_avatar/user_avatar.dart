import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mozz_test_messenger/ui/theme/app_colors/app_gradients.dart';
import 'package:mozz_test_messenger/ui/theme/app_texts/app_text_styles.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
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