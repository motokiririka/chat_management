import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String toastMessage) {
  Fluttertoast.showToast(
      msg: toastMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0);
}

String formatDate(DateTime date) {
  final now = DateTime.now();
  final difference = now.difference(date);

  if (difference.inDays > 0) {
    return '${difference.inDays}日前';
  } else if (difference.inHours > 0) {
    return '${difference.inHours}時間前';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes}分前';
  } else {
    return 'たった今';
  }
}
