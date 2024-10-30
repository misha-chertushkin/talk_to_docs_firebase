import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/config_field/config_field_widget.dart';
import '/components/document_action_card/document_action_card_widget.dart';
import '/components/loader/loader_widget.dart';
import '/components/menu_bar/menu_bar_widget.dart';
import '/components/value_only_chip/value_only_chip_widget.dart';
import '/dialog_box/delete_document_dialog/delete_document_dialog_widget.dart';
import '/dialog_box/upload_documents_dialog/upload_documents_dialog_widget.dart';
import '/dialog_box/view_extracted_docs_dialog/view_extracted_docs_dialog_widget.dart';
import '/dialog_box/view_prompt_dialog/view_prompt_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'project_details_page_widget.dart' show ProjectDetailsPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProjectDetailsPageModel
    extends FlutterFlowModel<ProjectDetailsPageWidget> {
  ///  Local state fields for this page.

  bool gotProjectDetails = false;

  ProjectDetailStruct? details;
  void updateDetailsStruct(Function(ProjectDetailStruct) updateFn) {
    updateFn(details ??= ProjectDetailStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (ProjectDetails)] action in projectDetailsPage widget.
  ApiCallResponse? projectDetailsResp;
  // Model for menuBar component.
  late MenuBarModel menuBarModel;
  // Model for valueOnlyChip component.
  late ValueOnlyChipModel valueOnlyChipModel1;
  // Model for valueOnlyChip component.
  late ValueOnlyChipModel valueOnlyChipModel2;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - API (ProjectDetails)] action in documentActionCard widget.
  ApiCallResponse? detailsAfterDeleteDoc;
  // Stores action output result for [Backend Call - API (ProjectDetails)] action in documentActionCard widget.
  ApiCallResponse? projectDetailsRespAfterDocAdd;
  // Stores action output result for [Backend Call - API (getExtractedDoc)] action in documentActionCard widget.
  ApiCallResponse? docExtractionResp;
  // Model for configField component.
  late ConfigFieldModel configFieldModel1;
  // Model for configField component.
  late ConfigFieldModel configFieldModel2;
  // Model for configField component.
  late ConfigFieldModel configFieldModel3;
  // Model for configField component.
  late ConfigFieldModel configFieldModel4;
  // Model for configField component.
  late ConfigFieldModel configFieldModel5;
  // Model for configField component.
  late ConfigFieldModel configFieldModel6;
  // Model for configField component.
  late ConfigFieldModel configFieldModel7;
  // Model for configField component.
  late ConfigFieldModel configFieldModel8;
  // Model for configField component.
  late ConfigFieldModel configFieldModel9;
  // Model for configField component.
  late ConfigFieldModel configFieldModel10;
  // Model for configField component.
  late ConfigFieldModel configFieldModel11;
  // Model for configField component.
  late ConfigFieldModel configFieldModel12;
  // Model for configField component.
  late ConfigFieldModel configFieldModel13;
  // Model for configField component.
  late ConfigFieldModel configFieldModel14;
  // Model for configField component.
  late ConfigFieldModel configFieldModel15;
  // Model for configField component.
  late ConfigFieldModel configFieldModel16;
  // Model for configField component.
  late ConfigFieldModel configFieldModel17;
  // Model for configField component.
  late ConfigFieldModel configFieldModel18;
  // Model for configField component.
  late ConfigFieldModel configFieldModel19;
  // Model for configField component.
  late ConfigFieldModel configFieldModel20;
  // Model for configField component.
  late ConfigFieldModel configFieldModel21;
  // Model for configField component.
  late ConfigFieldModel configFieldModel22;
  // Model for configField component.
  late ConfigFieldModel configFieldModel23;
  // Stores action output result for [Backend Call - API (ProjectDetails)] action in configField widget.
  ApiCallResponse? detailsAfterPromptChange;

  @override
  void initState(BuildContext context) {
    menuBarModel = createModel(context, () => MenuBarModel());
    valueOnlyChipModel1 = createModel(context, () => ValueOnlyChipModel());
    valueOnlyChipModel2 = createModel(context, () => ValueOnlyChipModel());
    configFieldModel1 = createModel(context, () => ConfigFieldModel());
    configFieldModel2 = createModel(context, () => ConfigFieldModel());
    configFieldModel3 = createModel(context, () => ConfigFieldModel());
    configFieldModel4 = createModel(context, () => ConfigFieldModel());
    configFieldModel5 = createModel(context, () => ConfigFieldModel());
    configFieldModel6 = createModel(context, () => ConfigFieldModel());
    configFieldModel7 = createModel(context, () => ConfigFieldModel());
    configFieldModel8 = createModel(context, () => ConfigFieldModel());
    configFieldModel9 = createModel(context, () => ConfigFieldModel());
    configFieldModel10 = createModel(context, () => ConfigFieldModel());
    configFieldModel11 = createModel(context, () => ConfigFieldModel());
    configFieldModel12 = createModel(context, () => ConfigFieldModel());
    configFieldModel13 = createModel(context, () => ConfigFieldModel());
    configFieldModel14 = createModel(context, () => ConfigFieldModel());
    configFieldModel15 = createModel(context, () => ConfigFieldModel());
    configFieldModel16 = createModel(context, () => ConfigFieldModel());
    configFieldModel17 = createModel(context, () => ConfigFieldModel());
    configFieldModel18 = createModel(context, () => ConfigFieldModel());
    configFieldModel19 = createModel(context, () => ConfigFieldModel());
    configFieldModel20 = createModel(context, () => ConfigFieldModel());
    configFieldModel21 = createModel(context, () => ConfigFieldModel());
    configFieldModel22 = createModel(context, () => ConfigFieldModel());
    configFieldModel23 = createModel(context, () => ConfigFieldModel());
  }

  @override
  void dispose() {
    menuBarModel.dispose();
    valueOnlyChipModel1.dispose();
    valueOnlyChipModel2.dispose();
    tabBarController?.dispose();
    configFieldModel1.dispose();
    configFieldModel2.dispose();
    configFieldModel3.dispose();
    configFieldModel4.dispose();
    configFieldModel5.dispose();
    configFieldModel6.dispose();
    configFieldModel7.dispose();
    configFieldModel8.dispose();
    configFieldModel9.dispose();
    configFieldModel10.dispose();
    configFieldModel11.dispose();
    configFieldModel12.dispose();
    configFieldModel13.dispose();
    configFieldModel14.dispose();
    configFieldModel15.dispose();
    configFieldModel16.dispose();
    configFieldModel17.dispose();
    configFieldModel18.dispose();
    configFieldModel19.dispose();
    configFieldModel20.dispose();
    configFieldModel21.dispose();
    configFieldModel22.dispose();
    configFieldModel23.dispose();
  }
}
