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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'my_projects_page_model.dart';
export 'my_projects_page_model.dart';

class MyProjectsPageWidget extends StatefulWidget {
  const MyProjectsPageWidget({super.key});

  @override
  State<MyProjectsPageWidget> createState() => _MyProjectsPageWidgetState();
}

class _MyProjectsPageWidgetState extends State<MyProjectsPageWidget> {
  late MyProjectsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyProjectsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn) {
        FFAppState().selectedMenu = 2;
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

        _model.projectsListResp = await TalkDocsGroup.allProjectsCall.call(
          userId: currentUserEmail,
        );

        Navigator.pop(context);
        if ((_model.projectsListResp?.succeeded ?? true)) {
          _model.isNewUser = !(TalkDocsGroup.allProjectsCall.projectsList(
                    (_model.projectsListResp?.jsonBody ?? ''),
                  ) !=
                  null &&
              (TalkDocsGroup.allProjectsCall.projectsList(
                (_model.projectsListResp?.jsonBody ?? ''),
              ))!
                  .isNotEmpty);
          safeSetState(() {});
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Something went wrong!',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
          return;
        }
      } else {
        context.pushNamed('Login');

        return;
      }
    });

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
          title: 'myProjectsPage',
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
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 24.0, 0.0),
                              child: Container(
                                height: 120.0,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'My Projects',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'GoogleSans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(),
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
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () => FocusScope.of(
                                                          dialogContext)
                                                      .unfocus(),
                                                  child:
                                                      CreateNewProjectDialogWidget(),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: wrapWithModel(
                                          model:
                                              _model.primaryActionButtonModel1,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: PrimaryActionButtonWidget(
                                            actionName: 'Create New Project',
                                            actionIcon: Icon(
                                              Icons.add_rounded,
                                              color: Colors.white,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.userAvatarModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: UserAvatarWidget(),
                                    ),
                                  ].divide(SizedBox(width: 36.0)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  if (!_model.isNewUser) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 24.0, 36.0),
                                      child: Container(
                                        width: 1062.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (false)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  36.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          wrapWithModel(
                                                            model: _model
                                                                .primaryActionButtonModel2,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                PrimaryActionButtonWidget(
                                                              actionName:
                                                                  'Create New Project',
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 16.0)),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            if (TalkDocsGroup.allProjectsCall
                                                        .projectsList(
                                                      (_model.projectsListResp
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) !=
                                                    null &&
                                                (TalkDocsGroup.allProjectsCall
                                                        .projectsList(
                                                  (_model.projectsListResp
                                                          ?.jsonBody ??
                                                      ''),
                                                ))!
                                                    .isNotEmpty)
                                              Expanded(
                                                child: Builder(
                                                  builder: (context) {
                                                    final projectList =
                                                        TalkDocsGroup
                                                                .allProjectsCall
                                                                .projectsList(
                                                                  (_model.projectsListResp
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )
                                                                ?.toList() ??
                                                            [];

                                                    return FlutterFlowDataTable<
                                                        dynamic>(
                                                      controller: _model
                                                          .projectsTableController,
                                                      data: projectList,
                                                      columnsBuilder:
                                                          (onSortChanged) => [
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'Project  Name',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'GoogleSansText',
                                                                    color: Color(
                                                                        0xFF0B57D0),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'Created On',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'GoogleSansText',
                                                                    color: Color(
                                                                        0xFF0B57D0),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'Updated On',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'GoogleSansText',
                                                                    color: Color(
                                                                        0xFF0B57D0),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        DataColumn2(
                                                          label:
                                                              DefaultTextStyle
                                                                  .merge(
                                                            softWrap: true,
                                                            child: Text(
                                                              'Actions',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'GoogleSansText',
                                                                    color: Color(
                                                                        0xFF0B57D0),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                      dataRowBuilder: (projectListItem,
                                                              projectListIndex,
                                                              selected,
                                                              onSelectChanged) =>
                                                          DataRow(
                                                        cells: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              FFAppState()
                                                                      .projectID =
                                                                  getJsonField(
                                                                projectListItem,
                                                                r'''$.project_id''',
                                                              ).toString();
                                                              safeSetState(
                                                                  () {});

                                                              context.pushNamed(
                                                                'projectDetailsPage',
                                                                queryParameters:
                                                                    {
                                                                  'projectID':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      projectListItem,
                                                                      r'''$.project_id''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'projectName':
                                                                      serializeParam(
                                                                    ' ',
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
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          5.0,
                                                                          5.0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      projectListItem,
                                                                      r'''$.project_name''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'GoogleSans',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            functions
                                                                .changeDateTimeFormat(
                                                                    getJsonField(
                                                              projectListItem,
                                                              r'''$.created_on''',
                                                            ).toString())!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'GoogleSans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Text(
                                                            functions
                                                                .changeDateTimeFormat(
                                                                    getJsonField(
                                                              projectListItem,
                                                              r'''$.updated_on''',
                                                            ).toString())!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'GoogleSans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderRadius:
                                                                    8.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .copy_all,
                                                                  color: Color(
                                                                      0xFFE8EAED),
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  if ((String?
                                                                      readOnly) {
                                                                    return (readOnly ??
                                                                            '') ==
                                                                        "1";
                                                                  }(getJsonField(
                                                                    projectListItem,
                                                                    r'''$.read_only''',
                                                                  ).toString())) {
                                                                    return;
                                                                  }
                                                                },
                                                              ),
                                                              FlutterFlowIconButton(
                                                                borderRadius:
                                                                    8.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .delete_outline,
                                                                  color: Color(
                                                                      0xFFE8EAED),
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  if ((String?
                                                                      readOnly) {
                                                                    return (readOnly ??
                                                                            '') ==
                                                                        "1";
                                                                  }(getJsonField(
                                                                    projectListItem,
                                                                    r'''$.read_only''',
                                                                  ).toString())) {
                                                                    return;
                                                                  }
                                                                },
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 12.0)),
                                                          ),
                                                        ]
                                                            .map((c) =>
                                                                DataCell(c))
                                                            .toList(),
                                                      ),
                                                      paginated: false,
                                                      selectable: false,
                                                      headingRowHeight: 56.0,
                                                      dataRowHeight: 48.0,
                                                      columnSpacing: 150.0,
                                                      headingRowColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondryButtonBg,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      addHorizontalDivider:
                                                          true,
                                                      addTopAndBottomDivider:
                                                          true,
                                                      hideDefaultHorizontalDivider:
                                                          true,
                                                      horizontalDividerColor:
                                                          Color(0xFFC4C4C4),
                                                      horizontalDividerThickness:
                                                          1.0,
                                                      addVerticalDivider: false,
                                                    );
                                                  },
                                                ),
                                              ),
                                          ]
                                              .divide(SizedBox(height: 36.0))
                                              .addToStart(
                                                  SizedBox(height: 0.0)),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 24.0, 36.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 20.0,
                                              decoration: BoxDecoration(),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                GradientText(
                                                  'Hello,',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displayLarge
                                                      .override(
                                                        fontFamily:
                                                            'GoogleSans',
                                                        fontSize: 60.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                                  colors: [
                                                    Color(0xFF1967D2),
                                                    Color(0xFFFF8BCB)
                                                  ],
                                                  gradientDirection:
                                                      GradientDirection.ltr,
                                                  gradientType:
                                                      GradientType.linear,
                                                ),
                                                Text(
                                                  'What do you wanna do today?',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displayMedium
                                                      .override(
                                                        fontFamily:
                                                            'GoogleSans',
                                                        color:
                                                            Color(0xFFC4C7C5),
                                                        fontSize: 60.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Builder(
                                              builder: (context) => Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 36.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showDialog(
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
                                                                CreateNewProjectDialogWidget(),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: wrapWithModel(
                                                    model:
                                                        _model.hugeActionModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: HugeActionWidget(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]
                                              .divide(SizedBox(height: 40.0))
                                              .addToStart(
                                                  SizedBox(height: 0.0)),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
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
