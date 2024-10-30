import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String? getFileName(FFUploadedFile file) {
  return file.name;
}

String? changeDateTimeFormat(String dateTime) {
  // change dateTime from "2024-09-30T15:50:31.906870+00:00" format to dd MMM yyyy hh:mm
  DateTime parsedDateTime = DateTime.parse(dateTime);
  String formattedDateTime = DateFormat('MMM dd yyyy').format(parsedDateTime);
  return formattedDateTime;
}

bool isLastUserChat(
  List<ChatStruct> chatList,
  int index,
) {
  if (index == chatList.length - 1 && chatList[index].isAi) {
    return true;
  } else {
    return false;
  }
}

String? getQuestionsJsonFromList(List<String> questions) {
  if (questions.isNotEmpty) {
    Map<String, List<String>> questionsMap = {'questions': questions};
    String questionsJson = jsonEncode(questionsMap);
    return questionsJson;
  } else {
    return '';
  }
}

int getLastChatIndex(List<ChatStruct> chatList) {
  return chatList.length - 1;
}
