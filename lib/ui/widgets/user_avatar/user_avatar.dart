import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mozz_test_messenger/ui/theme/app_colors/app_gradients.dart';
import 'package:mozz_test_messenger/ui/theme/app_texts/app_text_styles.dart';

class UserAvatar extends StatelessWidget {
  final String? data;
  const UserAvatar({
    super.key,
    this.data
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

    String dataEditing(){
      String outputText = 'Error';

      if(data == null){
        return outputText;
      }

      outputText = data ?? "Error";

      List<String> list = outputText.split(' ');
      outputText = list[0][0] + list[1][0];

      return outputText;
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
            dataEditing(),
            style: AppTestStyles.profileAvatar,
          ),
        ),
      ),
    );
  }
}