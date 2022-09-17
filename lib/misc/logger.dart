/// Created by Ahmed Almahdie on 7/8/2021.
/// ahmedalmahdie2@gmail.com

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final Logger logger = Logger(
  printer: PrettyPrinter(
      methodCount: 4, // number of method calls to be displayed
      errorMethodCount: 4, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: true // Should each log print contain a timestamp
  ),
);

class MyLogger {
  static void log(String message, {String? tag}) {
      logger.d(
        message,
      );
  }
}

void logMessage(String message, {String? tag}) {
  // MyLogger.log(message, tag: tag);
    if (!kDebugMode) {
      print(message);
    } else {
      logger.d(
        message,
      );
    }
}

void multipleLog(String content, {String? tag}) {
  if (content.length > 500) {
    logMessage(content.substring(0, 500), tag: tag);
    multipleLog(content.substring(500), tag: tag ?? '' + ' + 1000');
  } else {
    logMessage(content, tag: tag);
  }
}

void largeLog(String content, {String? tag}) {
  if (content.length > 1000) {
    logMessage(content.substring(0, 1000), tag: tag);
    largeLog(content.substring(1000), tag: tag != null ? tag + ' + 1000' : '');
  } else {
    logMessage(content, tag: tag);
  }
}
