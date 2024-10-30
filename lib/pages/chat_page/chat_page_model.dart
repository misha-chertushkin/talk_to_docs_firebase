import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/chat_item/chat_item_widget.dart';
import '/components/loader/loader_widget.dart';
import '/components/menu_bar/menu_bar_widget.dart';
import '/components/primary_action_button/primary_action_button_widget.dart';
import '/components/project_dropdown/project_dropdown_widget.dart';
import '/components/project_title/project_title_widget.dart';
import '/components/secondary_action_button/secondary_action_button_widget.dart';
import '/components/user_avatar/user_avatar_widget.dart';
import '/dialog_box/clear_chat_dialog/clear_chat_dialog_widget.dart';
import '/dialog_box/debug_panel_dialog/debug_panel_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/phase2_components/prompt_questions/prompt_questions_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'chat_page_widget.dart' show ChatPageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ChatPageModel extends FlutterFlowModel<ChatPageWidget> {
  ///  Local state fields for this page.

  DocumentUploadStatus? importStatus = DocumentUploadStatus.Neutral;

  ChatListModelStruct? projectChat;
  void updateProjectChatStruct(Function(ChatListModelStruct) updateFn) {
    updateFn(projectChat ??= ChatListModelStruct());
  }

  bool pageLoaded = false;

  bool isUserAvatarClicked = false;

  bool sendingChat = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (AllProjects)] action in chatPage widget.
  ApiCallResponse? allProjectResponse;
  // Stores action output result for [Backend Call - API (PreviousChat)] action in chatPage widget.
  ApiCallResponse? previousChatResp;
  // Stores action output result for [Backend Call - API (ImportStatus)] action in chatPage widget.
  ApiCallResponse? importStatusResp;
  // Model for menuBar.
  late MenuBarModel menuBarModel;
  // Model for projectTitle component.
  late ProjectTitleModel projectTitleModel;
  // Model for secondaryActionButton component.
  late SecondaryActionButtonModel secondaryActionButtonModel1;
  // Model for secondaryActionButton component.
  late SecondaryActionButtonModel secondaryActionButtonModel2;
  // Stores action output result for [Backend Call - API (ClearChat)] action in secondaryActionButton widget.
  ApiCallResponse? clearChatResp;
  // Model for userAvatar component.
  late UserAvatarModel userAvatarModel;
  // Model for primaryActionButton component.
  late PrimaryActionButtonModel primaryActionButtonModel;
  // Stores action output result for [Backend Call - API (ImportStatus)] action in primaryActionButton widget.
  ApiCallResponse? importStatusBtnResp;
  // State field(s) for chatListView widget.
  ScrollController? chatListView;
  // Models for chatItem dynamic component.
  late FlutterFlowDynamicModels<ChatItemModel> chatItemModels;
  // Stores action output result for [Backend Call - API (DebugResponse)] action in chatItem widget.
  ApiCallResponse? debugDetailResp;
  // State field(s) for Row widget.
  ScrollController? rowController;
  // State field(s) for userChatField widget.
  FocusNode? userChatFieldFocusNode;
  TextEditingController? userChatFieldTextController;
  String? Function(BuildContext, String?)? userChatFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (Chat)] action in userChatField widget.
  ApiCallResponse? chatRespOnSubmit;
  // Stores action output result for [Backend Call - API (Chat)] action in IconButton widget.
  ApiCallResponse? chatResp;

  @override
  void initState(BuildContext context) {
    menuBarModel = createModel(context, () => MenuBarModel());
    projectTitleModel = createModel(context, () => ProjectTitleModel());
    secondaryActionButtonModel1 =
        createModel(context, () => SecondaryActionButtonModel());
    secondaryActionButtonModel2 =
        createModel(context, () => SecondaryActionButtonModel());
    userAvatarModel = createModel(context, () => UserAvatarModel());
    primaryActionButtonModel =
        createModel(context, () => PrimaryActionButtonModel());
    chatListView = ScrollController();
    chatItemModels = FlutterFlowDynamicModels(() => ChatItemModel());
    rowController = ScrollController();
  }

  @override
  void dispose() {
    menuBarModel.dispose();
    projectTitleModel.dispose();
    secondaryActionButtonModel1.dispose();
    secondaryActionButtonModel2.dispose();
    userAvatarModel.dispose();
    primaryActionButtonModel.dispose();
    chatListView?.dispose();
    chatItemModels.dispose();
    rowController?.dispose();
    userChatFieldFocusNode?.dispose();
    userChatFieldTextController?.dispose();
  }
}
