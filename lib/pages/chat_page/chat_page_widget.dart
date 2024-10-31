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
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'chat_page_model.dart';
export 'chat_page_model.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({
    super.key,
    required this.projectId,
  });

  final String? projectId;

  @override
  State<ChatPageWidget> createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> {
  late ChatPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().selectedMenu = 1;
      safeSetState(() {});
      showDialog(
        barrierColor: FlutterFlowTheme.of(context).loaderBg,
        barrierDismissible: false,
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: GestureDetector(
              onTap: () => FocusScope.of(dialogContext).unfocus(),
              child: LoaderWidget(),
            ),
          );
        },
      );

      _model.allProjectResponse = await TalkDocsGroup.allProjectsCall.call(
        userId: currentUserEmail,
      );

      if ((_model.allProjectResponse?.succeeded ?? true)) {
        _model.previousChatResp = await TalkDocsGroup.previousChatCall.call(
          userId: currentUserEmail,
          clientProjectId: widget!.projectId,
        );

        if ((_model.previousChatResp?.succeeded ?? true)) {
          _model.projectChat = ChatListModelStruct.maybeFromMap(
              (_model.previousChatResp?.jsonBody ?? ''));
          _model.pageLoaded = true;
          safeSetState(() {});
          _model.importStatusResp = await TalkDocsGroup.importStatusCall.call(
            userId: currentUserEmail,
            projectId: widget!.projectId,
          );

          Navigator.pop(context);
          await _model.chatListView?.animateTo(
            _model.chatListView!.position.maxScrollExtent,
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          );
          if ((_model.importStatusResp?.succeeded ?? true)) {
            if (TalkDocsGroup.importStatusCall.pendingLRO(
                      (_model.importStatusResp?.jsonBody ?? ''),
                    ) !=
                    null &&
                (TalkDocsGroup.importStatusCall.pendingLRO(
                  (_model.importStatusResp?.jsonBody ?? ''),
                ))!
                    .isNotEmpty) {
              _model.importStatus = DocumentUploadStatus.InProgress;
              safeSetState(() {});
            } else {
              _model.importStatus = DocumentUploadStatus.Uploaded;
              safeSetState(() {});
            }

            return;
          } else {
            return;
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Something went worng!',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
          Navigator.pop(context);
          return;
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Something went worng!',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
        Navigator.pop(context);
        return;
      }
    });

    _model.userChatFieldTextController ??= TextEditingController();
    _model.userChatFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => Title(
          title: 'chatPage',
          color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                top: true,
                child: Container(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.sizeOf(context).width * 1.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.menuBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: MenuBarWidget(),
                      ),
                      if (_model.pageLoaded)
                        Expanded(
                          child: Container(
                            width: 1062.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 36.0, 36.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 120.0,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Builder(
                                            builder: (context) => Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 200.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  showAlignedDialog(
                                                    barrierColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    isGlobal: false,
                                                    avoidOverflow: false,
                                                    targetAnchor:
                                                        AlignmentDirectional(
                                                                0.0, 10.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    followerAnchor:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    builder: (dialogContext) {
                                                      return Material(
                                                        color:
                                                            Colors.transparent,
                                                        child: GestureDetector(
                                                          onTap: () =>
                                                              FocusScope.of(
                                                                      dialogContext)
                                                                  .unfocus(),
                                                          child:
                                                              ProjectDropdownWidget(
                                                            projectList: TalkDocsGroup
                                                                .allProjectsCall
                                                                .projectsList(
                                                              (_model.allProjectResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!,
                                                            onProjectClick:
                                                                (projectId) async {
                                                              FFAppState()
                                                                      .projectID =
                                                                  projectId;
                                                              safeSetState(
                                                                  () {});
                                                              if (Navigator.of(
                                                                      context)
                                                                  .canPop()) {
                                                                context.pop();
                                                              }
                                                              context.pushNamed(
                                                                'chatPage',
                                                                queryParameters:
                                                                    {
                                                                  'projectId':
                                                                      serializeParam(
                                                                    projectId,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .fade,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            0),
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: wrapWithModel(
                                                  model:
                                                      _model.projectTitleModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: ProjectTitleWidget(
                                                    title: _model.projectChat!
                                                        .projectName,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'projectDetailsPage',
                                              queryParameters: {
                                                'projectID': serializeParam(
                                                  widget!.projectId,
                                                  ParamType.String,
                                                ),
                                                'projectName': serializeParam(
                                                  'Sample',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          },
                                          child: wrapWithModel(
                                            model: _model
                                                .secondaryActionButtonModel1,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: SecondaryActionButtonWidget(
                                              actionName:
                                                  'Project Configuration',
                                              actionIcon: Icon(
                                                Icons.info_rounded,
                                                color: Color(0xFF717171),
                                                size: 24.0,
                                              ),
                                              actionIconColor:
                                                  Color(0xFF717171),
                                              hasIcon: true,
                                            ),
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () =>
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus(),
                                                      child:
                                                          ClearChatDialogWidget(
                                                        onClearChat: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          showDialog(
                                                            barrierColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .loaderBg,
                                                            barrierDismissible:
                                                                false,
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () =>
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus(),
                                                                  child:
                                                                      LoaderWidget(),
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          _model.clearChatResp =
                                                              await TalkDocsGroup
                                                                  .clearChatCall
                                                                  .call(
                                                            clientProjectId:
                                                                widget!
                                                                    .projectId,
                                                            userId:
                                                                currentUserEmail,
                                                          );

                                                          _shouldSetState =
                                                              true;
                                                          if ((_model
                                                                  .clearChatResp
                                                                  ?.succeeded ??
                                                              true)) {
                                                            _model
                                                                .updateProjectChatStruct(
                                                              (e) => e
                                                                ..chatList = [],
                                                            );
                                                            _model.pageLoaded =
                                                                true;
                                                            safeSetState(() {});
                                                            Navigator.pop(
                                                                context);
                                                            return;
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Something went worng!',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                            Navigator.pop(
                                                                context);
                                                            return;
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );

                                              safeSetState(() {});
                                            },
                                            child: wrapWithModel(
                                              model: _model
                                                  .secondaryActionButtonModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child:
                                                  SecondaryActionButtonWidget(
                                                actionName: 'Clear Chat',
                                                actionIcon: Icon(
                                                  Icons.clear_all_rounded,
                                                  color: Color(0xFFEA4335),
                                                  size: 24.0,
                                                ),
                                                actionIconColor:
                                                    Color(0xFFEA4335),
                                                hasIcon: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.userAvatarModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: UserAvatarWidget(),
                                        ),
                                      ].divide(SizedBox(width: 36.0)),
                                    ),
                                  ),
                                  if (_model.importStatus ==
                                      DocumentUploadStatus.InProgress)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            'Import in progress...',
                                            style: FlutterFlowTheme.of(context)
                                                .displayLarge
                                                .override(
                                                  fontFamily: 'GoogleSans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .headingColor,
                                                  fontSize: 48.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                'some functionality might be limited',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .displayMedium
                                                    .override(
                                                      fontFamily: 'GoogleSans',
                                                      color: Color(0xFFC4C7C5),
                                                      fontSize: 40.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                              Lottie.network(
                                                'https://lottie.host/d9b3ecac-a40b-4654-9861-cc35a2eb0f72/Aiy01nrxIX.json',
                                                width: 40.0,
                                                height: 40.0,
                                                fit: BoxFit.contain,
                                                animate: true,
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                          Container(
                                            height: 36.0,
                                            decoration: BoxDecoration(),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) => InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    showDialog(
                                                      barrierColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .loaderBg,
                                                      barrierDismissible: false,
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () =>
                                                                FocusScope.of(
                                                                        dialogContext)
                                                                    .unfocus(),
                                                            child:
                                                                LoaderWidget(),
                                                          ),
                                                        );
                                                      },
                                                    );

                                                    _model.importStatusBtnResp =
                                                        await TalkDocsGroup
                                                            .importStatusCall
                                                            .call(
                                                      userId: currentUserEmail,
                                                      projectId:
                                                          widget!.projectId,
                                                    );

                                                    Navigator.pop(context);
                                                    if ((_model
                                                            .importStatusBtnResp
                                                            ?.succeeded ??
                                                        true)) {
                                                      if (TalkDocsGroup
                                                                  .importStatusCall
                                                                  .pendingLRO(
                                                                (_model.importStatusBtnResp
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) !=
                                                              null &&
                                                          (TalkDocsGroup
                                                                  .importStatusCall
                                                                  .pendingLRO(
                                                            (_model.importStatusBtnResp
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ))!
                                                              .isNotEmpty) {
                                                        _model.importStatus =
                                                            DocumentUploadStatus
                                                                .InProgress;
                                                        safeSetState(() {});
                                                      } else {
                                                        _model.importStatus =
                                                            DocumentUploadStatus
                                                                .Uploaded;
                                                        safeSetState(() {});
                                                      }
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .primaryActionButtonModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        PrimaryActionButtonWidget(
                                                      actionName:
                                                          'Check Import Status',
                                                      actionIcon: Icon(
                                                        Icons.restart_alt,
                                                        color: Colors.white,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  if ((_model.importStatus ==
                                          DocumentUploadStatus.Uploaded) &&
                                      !(_model
                                          .projectChat!.chatList.isNotEmpty))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'You are all set!',
                                            style: FlutterFlowTheme.of(context)
                                                .displayLarge
                                                .override(
                                                  fontFamily: 'GoogleSans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .headingColor,
                                                  fontSize: 48.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                'you can now Talk2Bugs!',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .displayMedium
                                                    .override(
                                                      fontFamily: 'GoogleSans',
                                                      color: Color(0xFFC4C7C5),
                                                      fontSize: 40.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                              Lottie.network(
                                                'https://lottie.host/d9b3ecac-a40b-4654-9861-cc35a2eb0f72/Aiy01nrxIX.json',
                                                width: 40.0,
                                                height: 40.0,
                                                fit: BoxFit.contain,
                                                animate: true,
                                              ),
                                            ].divide(SizedBox(width: 24.0)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final chatList = _model
                                                      .projectChat?.chatList
                                                      ?.toList() ??
                                                  [];

                                              return ListView.separated(
                                                padding: EdgeInsets.fromLTRB(
                                                  0,
                                                  40.0,
                                                  0,
                                                  160.0,
                                                ),
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: chatList.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 20.0),
                                                itemBuilder:
                                                    (context, chatListIndex) {
                                                  final chatListItem =
                                                      chatList[chatListIndex];
                                                  return Builder(
                                                    builder: (context) =>
                                                        wrapWithModel(
                                                      model: _model
                                                          .chatItemModels
                                                          .getModel(
                                                        chatListItem
                                                            .isDebugVisible
                                                            .toString(),
                                                        chatListIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: ChatItemWidget(
                                                        key: Key(
                                                          'Key8l2_${chatListItem.isDebugVisible.toString()}',
                                                        ),
                                                        chat: chatListItem,
                                                        index: chatListIndex,
                                                        showDebug: chatListItem
                                                                .isAi &&
                                                            chatListItem
                                                                .isDebugVisible,
                                                        sendingChat: false,
                                                        onDebugClick: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          if (chatListItem
                                                              .isAi) {
                                                            _model.debugDetailResp =
                                                                await TalkDocsGroup
                                                                    .debugResponseCall
                                                                    .call(
                                                              responseId:
                                                                  chatListItem
                                                                      .responseId,
                                                            );

                                                            _shouldSetState =
                                                                true;
                                                            if ((_model
                                                                    .debugDetailResp
                                                                    ?.succeeded ??
                                                                true)) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () =>
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus(),
                                                                      child:
                                                                          Container(
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.65,
                                                                        child:
                                                                            DebugPanelDialogWidget(
                                                                          timeTaken: TalkDocsGroup
                                                                              .debugResponseCall
                                                                              .timeTaken(
                                                                            (_model.debugDetailResp?.jsonBody ??
                                                                                ''),
                                                                          )!,
                                                                          confidenceScore: TalkDocsGroup
                                                                              .debugResponseCall
                                                                              .confidenceScore(
                                                                                (_model.debugDetailResp?.jsonBody ?? ''),
                                                                              )!
                                                                              .toString(),
                                                                          previousContext: TalkDocsGroup
                                                                              .debugResponseCall
                                                                              .previousContext(
                                                                            (_model.debugDetailResp?.jsonBody ??
                                                                                ''),
                                                                          )!,
                                                                          question: TalkDocsGroup
                                                                              .debugResponseCall
                                                                              .question(
                                                                            (_model.debugDetailResp?.jsonBody ??
                                                                                ''),
                                                                          )!,
                                                                          finalResponse: TalkDocsGroup
                                                                              .debugResponseCall
                                                                              .finalResponse(
                                                                            (_model.debugDetailResp?.jsonBody ??
                                                                                ''),
                                                                          )!,
                                                                          roundInfoList: TalkDocsGroup
                                                                              .debugResponseCall
                                                                              .roundsInfoList(
                                                                            (_model.debugDetailResp?.jsonBody ??
                                                                                ''),
                                                                          )!,
                                                                          roundDocList: TalkDocsGroup
                                                                              .debugResponseCall
                                                                              .roundDocsList(
                                                                            (_model.debugDetailResp?.jsonBody ??
                                                                                ''),
                                                                          )!,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Something went wrong!',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            }

                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          } else {
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                                controller: _model.chatListView,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              final question = _model
                                                      .projectChat?.questions
                                                      ?.toList() ??
                                                  [];

                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                controller:
                                                    _model.rowController,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      question.length,
                                                      (questionIndex) {
                                                    final questionItem =
                                                        question[questionIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        safeSetState(() {
                                                          _model.userChatFieldTextController
                                                                  ?.text =
                                                              questionItem;
                                                          _model.userChatFieldTextController
                                                                  ?.selection =
                                                              TextSelection.collapsed(
                                                                  offset: _model
                                                                      .userChatFieldTextController!
                                                                      .text
                                                                      .length);
                                                        });
                                                      },
                                                      child:
                                                          PromptQuestionsWidget(
                                                        key: Key(
                                                            'Keytg4_${questionIndex}_of_${question.length}'),
                                                        promptQuestion:
                                                            questionItem,
                                                      ),
                                                    );
                                                  }).divide(
                                                      SizedBox(width: 20.0)),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 8.0, 0.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .userChatFieldTextController,
                                                    focusNode: _model
                                                        .userChatFieldFocusNode,
                                                    onFieldSubmitted:
                                                        (_) async {
                                                      var _shouldSetState =
                                                          false;
                                                      if (_model.userChatFieldTextController
                                                                  .text !=
                                                              null &&
                                                          _model.userChatFieldTextController
                                                                  .text !=
                                                              '') {
                                                        _model
                                                            .updateProjectChatStruct(
                                                          (e) => e
                                                            ..updateChatList(
                                                              (e) => e.add(
                                                                  ChatStruct(
                                                                message: _model
                                                                    .userChatFieldTextController
                                                                    .text,
                                                                isAi: false,
                                                                responseId: ' ',
                                                              )),
                                                            ),
                                                        );
                                                        _model.sendingChat =
                                                            true;
                                                        safeSetState(() {});
                                                        safeSetState(() {
                                                          _model
                                                              .userChatFieldTextController
                                                              ?.clear();
                                                        });
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    100));
                                                        await _model
                                                            .chatListView
                                                            ?.animateTo(
                                                          _model
                                                              .chatListView!
                                                              .position
                                                              .maxScrollExtent,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  200),
                                                          curve: Curves.ease,
                                                        );
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    100));
                                                      } else {
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      }

                                                      _model.chatRespOnSubmit =
                                                          await TalkDocsGroup
                                                              .chatCall
                                                              .call(
                                                        message: _model
                                                            .projectChat
                                                            ?.chatList
                                                            ?.last
                                                            ?.message,
                                                        userId:
                                                            currentUserEmail,
                                                        clientProjectId:
                                                            widget!.projectId,
                                                      );

                                                      _shouldSetState = true;
                                                      _model.sendingChat =
                                                          false;
                                                      safeSetState(() {});
                                                      if ((_model
                                                              .chatRespOnSubmit
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model
                                                            .updateProjectChatStruct(
                                                          (e) => e
                                                            ..updateChatList(
                                                              (e) => e.add(ChatStruct
                                                                  .maybeFromMap((_model
                                                                          .chatRespOnSubmit
                                                                          ?.jsonBody ??
                                                                      ''))!),
                                                            ),
                                                        );
                                                        safeSetState(() {});
                                                        _model
                                                            .updateProjectChatStruct(
                                                          (e) => e
                                                            ..updateChatList(
                                                              (e) => e[functions
                                                                  .getLastChatIndex(_model
                                                                      .projectChat!
                                                                      .chatList
                                                                      .toList())]
                                                                ..isDebugVisible =
                                                                    false,
                                                            ),
                                                        );
                                                        safeSetState(() {});
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    200));
                                                        await _model
                                                            .chatListView
                                                            ?.animateTo(
                                                          _model
                                                              .chatListView!
                                                              .position
                                                              .maxScrollExtent,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  200),
                                                          curve: Curves.ease,
                                                        );
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    2000));
                                                        _model
                                                            .updateProjectChatStruct(
                                                          (e) => e
                                                            ..updateChatList(
                                                              (e) => e[functions
                                                                  .getLastChatIndex(_model
                                                                      .projectChat!
                                                                      .chatList
                                                                      .toList())]
                                                                ..isDebugVisible =
                                                                    true,
                                                            ),
                                                        );
                                                        safeSetState(() {});
                                                      }
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                    },
                                                    autofocus: true,
                                                    textInputAction:
                                                        TextInputAction.done,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      alignLabelWithHint: false,
                                                      hintText:
                                                          'Enter Prompt Here',
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      focusedErrorBorder:
                                                          InputBorder.none,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'GoogleSans',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.5,
                                                        ),
                                                    maxLines: 10,
                                                    minLines: 1,
                                                    validator: _model
                                                        .userChatFieldTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    if (!_model.sendingChat) {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    15.0,
                                                                    5.0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          icon: Icon(
                                                            Icons.send_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            if (_model.userChatFieldTextController
                                                                        .text !=
                                                                    null &&
                                                                _model.userChatFieldTextController
                                                                        .text !=
                                                                    '') {
                                                              _model
                                                                  .updateProjectChatStruct(
                                                                (e) => e
                                                                  ..updateChatList(
                                                                    (e) => e.add(
                                                                        ChatStruct(
                                                                      message: _model
                                                                          .userChatFieldTextController
                                                                          .text,
                                                                      isAi:
                                                                          false,
                                                                      responseId:
                                                                          ' ',
                                                                    )),
                                                                  ),
                                                              );
                                                              _model.sendingChat =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model
                                                                    .userChatFieldTextController
                                                                    ?.clear();
                                                              });
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          100));
                                                              await _model
                                                                  .chatListView
                                                                  ?.animateTo(
                                                                _model
                                                                    .chatListView!
                                                                    .position
                                                                    .maxScrollExtent,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        200),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          100));
                                                            } else {
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }

                                                            _model.chatResp =
                                                                await TalkDocsGroup
                                                                    .chatCall
                                                                    .call(
                                                              message: _model
                                                                  .projectChat
                                                                  ?.chatList
                                                                  ?.last
                                                                  ?.message,
                                                              clientProjectId:
                                                                  widget!
                                                                      .projectId,
                                                              userId:
                                                                  currentUserEmail,
                                                            );

                                                            _shouldSetState =
                                                                true;
                                                            _model.sendingChat =
                                                                false;
                                                            safeSetState(() {});
                                                            if ((_model.chatResp
                                                                    ?.succeeded ??
                                                                true)) {
                                                              _model
                                                                  .updateProjectChatStruct(
                                                                (e) => e
                                                                  ..updateChatList(
                                                                    (e) => e.add(ChatStruct.maybeFromMap((_model
                                                                            .chatResp
                                                                            ?.jsonBody ??
                                                                        ''))!),
                                                                  ),
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                              _model
                                                                  .updateProjectChatStruct(
                                                                (e) => e
                                                                  ..updateChatList(
                                                                    (e) => e[functions.getLastChatIndex(_model
                                                                        .projectChat!
                                                                        .chatList
                                                                        .toList())]
                                                                      ..isDebugVisible =
                                                                          false,
                                                                  ),
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          200));
                                                              await _model
                                                                  .chatListView
                                                                  ?.animateTo(
                                                                _model
                                                                    .chatListView!
                                                                    .position
                                                                    .maxScrollExtent,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        200),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                              await Future.delayed(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          2000));
                                                              _model
                                                                  .updateProjectChatStruct(
                                                                (e) => e
                                                                  ..updateChatList(
                                                                    (e) => e[functions.getLastChatIndex(_model
                                                                        .projectChat!
                                                                        .chatList
                                                                        .toList())]
                                                                      ..isDebugVisible =
                                                                          true,
                                                                  ),
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                          },
                                                        ),
                                                      );
                                                    } else {
                                                      return Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Lottie.network(
                                                          'https://lottie.host/f11ceba6-48e7-4f60-9587-8a7e4700f3e1/F9qFshmMJO.json',
                                                          width: 48.0,
                                                          height: 48.0,
                                                          fit: BoxFit.contain,
                                                          animate: true,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 16.0))
                                          .addToStart(SizedBox(height: 20.0)),
                                    ),
                                  ),
                                ].addToStart(SizedBox(height: 0.0)),
                              ),
                            ),
                          ),
                        ),
                    ].divide(SizedBox(width: 80.0)),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
