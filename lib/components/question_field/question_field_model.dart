import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'question_field_widget.dart' show QuestionFieldWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionFieldModel extends FlutterFlowModel<QuestionFieldWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for questionField widget.
  FocusNode? questionFieldFocusNode;
  TextEditingController? questionFieldTextController;
  String? Function(BuildContext, String?)? questionFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    questionFieldFocusNode?.dispose();
    questionFieldTextController?.dispose();
  }
}
