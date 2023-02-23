import 'package:flutter/material.dart';

class UnexpectedError implements Exception {
  String message;

  UnexpectedError(this.message) {
    debugPrint(message.toString());
  }
}
