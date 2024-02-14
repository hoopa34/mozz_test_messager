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
  static TextStyle profileAvatar = TextStyle(
    fontSize: 20,
    height: 24.76 / 20,
    fontWeight: FontWeight.w700,
    color: AppColors.background,
  );
  static TextStyle profileTitle = TextStyle(
    fontSize: 15,
    height: 18.38 / 15,
    fontWeight: FontWeight.w600,
    color: AppColors.deepDark,
  );
  static TextStyle profileYou = TextStyle(
    fontSize: 12,
    height: 14.56 / 12,
    color: AppColors.black,
  );
  static TextStyle profileMessage = TextStyle(
    fontSize: 12,
    height: 14.56 / 12,
    color: AppColors.darkGray,
  );
  static TextStyle contactMessage = TextStyle(
    fontSize: 14,
    height: 16.98 / 14,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static TextStyle userMessage = TextStyle(
    fontSize: 14,
    height: 16.98 / 14,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGreen,
  );
  static TextStyle date = TextStyle(
    fontSize: 14,
    height: 16.98 / 14,
    fontWeight: FontWeight.w500,
    color: AppColors.gray,
  );
}
