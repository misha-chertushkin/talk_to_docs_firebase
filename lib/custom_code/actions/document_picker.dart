// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:file_picker/file_picker.dart';

Future<List<FFUploadedFile>> documentPicker(
    List<FFUploadedFile> previousFiles) async {
  // open file picker for web to select multiple files which only accepts pdf, doc and docx file formats and returns list of file

  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf', 'doc', 'docx'],
    allowMultiple: true,
  );

  List<FFUploadedFile> fileList = [];
  if (result != null) {
    for (PlatformFile file in result.files) {
      FFUploadedFile uploadedFile = FFUploadedFile(
        name: file.name.split('/').last,
        bytes: file.bytes,
      );
      fileList.add(uploadedFile);
    }
  }
  previousFiles.addAll(fileList);
  return previousFiles;
}
