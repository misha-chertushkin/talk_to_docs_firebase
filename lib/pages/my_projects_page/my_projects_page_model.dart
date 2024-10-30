import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/huge_action/huge_action_widget.dart';
import '/components/loader/loader_widget.dart';
import '/components/menu_bar/menu_bar_widget.dart';
import '/components/primary_action_button/primary_action_button_widget.dart';
import '/components/user_avatar/user_avatar_widget.dart';
import '/dialog_box/create_new_project_dialog/create_new_project_dialog_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'my_projects_page_widget.dart' show MyProjectsPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class MyProjectsPageModel extends FlutterFlowModel<MyProjectsPageWidget> {
  ///  Local state fields for this page.

  bool isNewUser = false;

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (AllProjects)] action in myProjectsPage widget.
  ApiCallResponse? projectsListResp;
  // Model for menuBar component.
  late MenuBarModel menuBarModel;
  // Model for primaryActionButton component.
  late PrimaryActionButtonModel primaryActionButtonModel1;
  // Model for userAvatar component.
  late UserAvatarModel userAvatarModel;
  // Model for primaryActionButton component.
  late PrimaryActionButtonModel primaryActionButtonModel2;
  // State field(s) for ProjectsTable widget.
  final projectsTableController = FlutterFlowDataTableController<dynamic>();
  // Model for hugeAction component.
  late HugeActionModel hugeActionModel;

  @override
  void initState(BuildContext context) {
    menuBarModel = createModel(context, () => MenuBarModel());
    primaryActionButtonModel1 =
        createModel(context, () => PrimaryActionButtonModel());
    userAvatarModel = createModel(context, () => UserAvatarModel());
    primaryActionButtonModel2 =
        createModel(context, () => PrimaryActionButtonModel());
    hugeActionModel = createModel(context, () => HugeActionModel());
  }

  @override
  void dispose() {
    menuBarModel.dispose();
    primaryActionButtonModel1.dispose();
    userAvatarModel.dispose();
    primaryActionButtonModel2.dispose();
    projectsTableController.dispose();
    hugeActionModel.dispose();
  }
}
