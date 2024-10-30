import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/document_action_card/document_action_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'upload_documents_dialog_widget.dart' show UploadDocumentsDialogWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UploadDocumentsDialogModel
    extends FlutterFlowModel<UploadDocumentsDialogWidget> {
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

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - documentPicker] action in Button widget.
  List<FFUploadedFile>? returnedDocs;
  // State field(s) for GridView widget.
  ScrollController? gridViewController;
  // Stores action output result for [Backend Call - API (UploadFilesToProject)] action in Button widget.
  ApiCallResponse? uploadDocResp;

  @override
  void initState(BuildContext context) {
    gridViewController = ScrollController();
  }

  @override
  void dispose() {
    gridViewController?.dispose();
  }
}
