import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'view_prompt_dialog_widget.dart' show ViewPromptDialogWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewPromptDialogModel extends FlutterFlowModel<ViewPromptDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for promptValueField widget.
  FocusNode? promptValueFieldFocusNode;
  TextEditingController? promptValueFieldTextController;
  String? Function(BuildContext, String?)?
      promptValueFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (ChangePrompt)] action in Button widget.
  ApiCallResponse? changePromptResp;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    promptValueFieldFocusNode?.dispose();
    promptValueFieldTextController?.dispose();
  }
}
