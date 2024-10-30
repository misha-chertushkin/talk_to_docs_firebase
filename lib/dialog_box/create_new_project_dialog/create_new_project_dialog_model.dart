import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/document_action_card/document_action_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_new_project_dialog_widget.dart'
    show CreateNewProjectDialogWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateNewProjectDialogModel
    extends FlutterFlowModel<CreateNewProjectDialogWidget> {
  ///  Local state fields for this component.

  List<FFUploadedFile> docsToUpload = [];
  void addToDocsToUpload(FFUploadedFile item) => docsToUpload.add(item);
  void removeFromDocsToUpload(FFUploadedFile item) => docsToUpload.remove(item);
  void removeAtIndexFromDocsToUpload(int index) => docsToUpload.removeAt(index);
  void insertAtIndexInDocsToUpload(int index, FFUploadedFile item) =>
      docsToUpload.insert(index, item);
  void updateDocsToUploadAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      docsToUpload[index] = updateFn(docsToUpload[index]);

  bool errorVisibility = false;

  String errMsg = 'All fields are required!';

  List<String> questionsList = [];
  void addToQuestionsList(String item) => questionsList.add(item);
  void removeFromQuestionsList(String item) => questionsList.remove(item);
  void removeAtIndexFromQuestionsList(int index) =>
      questionsList.removeAt(index);
  void insertAtIndexInQuestionsList(int index, String item) =>
      questionsList.insert(index, item);
  void updateQuestionsListAtIndex(int index, Function(String) updateFn) =>
      questionsList[index] = updateFn(questionsList[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for projectNameField widget.
  FocusNode? projectNameFieldFocusNode;
  TextEditingController? projectNameFieldTextController;
  String? Function(BuildContext, String?)?
      projectNameFieldTextControllerValidator;
  // State field(s) for questionField1 widget.
  FocusNode? questionField1FocusNode;
  TextEditingController? questionField1TextController;
  String? Function(BuildContext, String?)?
      questionField1TextControllerValidator;
  // State field(s) for questionField2 widget.
  FocusNode? questionField2FocusNode;
  TextEditingController? questionField2TextController;
  String? Function(BuildContext, String?)?
      questionField2TextControllerValidator;
  // State field(s) for questionField3 widget.
  FocusNode? questionField3FocusNode;
  TextEditingController? questionField3TextController;
  String? Function(BuildContext, String?)?
      questionField3TextControllerValidator;
  // Stores action output result for [Custom Action - documentPicker] action in Button widget.
  List<FFUploadedFile>? returnedDocs;
  // State field(s) for GridView widget.
  ScrollController? gridViewController;
  // Stores action output result for [Backend Call - API (CreateProject)] action in Button widget.
  ApiCallResponse? createProjectResp;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    gridViewController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    projectNameFieldFocusNode?.dispose();
    projectNameFieldTextController?.dispose();

    questionField1FocusNode?.dispose();
    questionField1TextController?.dispose();

    questionField2FocusNode?.dispose();
    questionField2TextController?.dispose();

    questionField3FocusNode?.dispose();
    questionField3TextController?.dispose();

    gridViewController?.dispose();
  }
}
