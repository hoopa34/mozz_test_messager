import 'package:flutter/material.dart';
import 'package:mozz_test_messenger/ui/theme/app_colors/app_colors.dart';

abstract class AppTestStyles {
  static TextStyle chats = TextStyle(
    fontSize: 32,
    height: 39.2 / 32,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  static TextStyle search = TextStyle(
    fontSize: 16,
    height: 19.41 / 16,
    fontWeight: FontWeight.w500,
    color: AppColors.gray,
  );
}
