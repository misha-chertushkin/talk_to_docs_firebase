import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/document_or_project_card/document_or_project_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'delete_document_dialog_widget.dart' show DeleteDocumentDialogWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeleteDocumentDialogModel
    extends FlutterFlowModel<DeleteDocumentDialogWidget> {
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

  // Model for documentOrProjectCard component.
  late DocumentOrProjectCardModel documentOrProjectCardModel;
  // Stores action output result for [Backend Call - API (RemoveDocuments)] action in Button widget.
  ApiCallResponse? docDeleteResp;

  @override
  void initState(BuildContext context) {
    documentOrProjectCardModel =
        createModel(context, () => DocumentOrProjectCardModel());
  }

  @override
  void dispose() {
    documentOrProjectCardModel.dispose();
  }
}
