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
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'project_details_page_model.dart';
export 'project_details_page_model.dart';

class ProjectDetailsPageWidget extends StatefulWidget {
  const ProjectDetailsPageWidget({
    super.key,
    String? projectID,
    required this.projectName,
  }) : this.projectID = projectID ?? '';

  final String projectID;
  final String? projectName;

  @override
  State<ProjectDetailsPageWidget> createState() =>
      _ProjectDetailsPageWidgetState();
}

class _ProjectDetailsPageWidgetState extends State<ProjectDetailsPageWidget>
    with TickerProviderStateMixin {
  late ProjectDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProjectDetailsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.75,
                child: LoaderWidget(),
              ),
            ),
          );
        },
      );

      _model.projectDetailsResp = await TalkDocsGroup.projectDetailsCall.call(
        projectId: widget!.projectID,
        userId: currentUserEmail,
      );

      Navigator.pop(context);
      if ((_model.projectDetailsResp?.succeeded ?? true)) {
        _model.gotProjectDetails = true;
        _model.details = ProjectDetailStruct.maybeFromMap(
            (_model.projectDetailsResp?.jsonBody ?? ''));
        safeSetState(() {});
        if (_model.details?.readOnly != '1') {
          _model.updateDetailsStruct(
            (e) => e
              ..updateDocuments(
                (e) => e.insert(
                    0,
                    DocumentsStruct(
                      isAddDocBtn: true,
                    )),
              ),
          );
          safeSetState(() {});
        } else {
          return;
        }
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
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Title(
          title: 'projectDetailsPage',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.menuBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: MenuBarWidget(),
                      ),
                      if (_model.gotProjectDetails)
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 36.0, 36.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 48.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderRadius: 8.0,
                                                      buttonSize: 60.0,
                                                      icon: Icon(
                                                        Icons
                                                            .chevron_left_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 36.0,
                                                      ),
                                                      onPressed: () async {
                                                        context.safePop();
                                                      },
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          _model.details!
                                                              .projectName
                                                              .maybeHandleOverflow(
                                                            maxChars: 60,
                                                            replacement: '…',
                                                          ),
                                                          maxLines: 1,
                                                          minFontSize: 20.0,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displayLarge
                                                              .override(
                                                                fontFamily:
                                                                    'GoogleSans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headingColor,
                                                                fontSize: 48.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          60.0, 0.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      wrapWithModel(
                                                        model: _model
                                                            .valueOnlyChipModel1,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            ValueOnlyChipWidget(
                                                          parameterTitle:
                                                              'Created On:',
                                                          parameterValue: functions
                                                              .changeDateTimeFormat(
                                                                  _model
                                                                      .details!
                                                                      .createdOn)!,
                                                          parameterIcon: Icon(
                                                            Icons
                                                                .access_time_rounded,
                                                            color: Color(
                                                                0xFFA7A7A7),
                                                            size: 24.0,
                                                          ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          strokeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent4,
                                                          textColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .valueOnlyChipModel2,
                                                        updateCallback: () =>
                                                            safeSetState(() {}),
                                                        child:
                                                            ValueOnlyChipWidget(
                                                          parameterTitle:
                                                              'Updated On:',
                                                          parameterValue: functions
                                                              .changeDateTimeFormat(
                                                                  _model
                                                                      .details!
                                                                      .updatedOn)!,
                                                          parameterIcon: Icon(
                                                            Icons.timelapse,
                                                            color: Color(
                                                                0xFFA7A7A7),
                                                            size: 24.0,
                                                          ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          strokeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent4,
                                                          textColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 20.0)),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 20.0)),
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderRadius: 8.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.more_vert,
                                              color: Color(0xFF121212),
                                              size: 24.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 10.0,
                                    decoration: BoxDecoration(),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment(0.0, 0),
                                          child: TabBar(
                                            labelColor: Color(0xFF0B57D0),
                                            unselectedLabelColor:
                                                Color(0xFF444746),
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily: 'GoogleSans',
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      useGoogleFonts: false,
                                                    ),
                                            unselectedLabelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily: 'GoogleSans',
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      useGoogleFonts: false,
                                                    ),
                                            indicatorColor: Color(0xFF0B57D0),
                                            indicatorWeight: 3.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 100.0, 0.0),
                                            tabs: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Icon(
                                                      Icons
                                                          .insert_drive_file_outlined,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Tab(
                                                    text: 'Documents',
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Icon(
                                                      Icons.add_road_rounded,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Tab(
                                                    text:
                                                        'System Configuration',
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Icon(
                                                      Icons
                                                          .auto_stories_outlined,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Tab(
                                                    text:
                                                        'Prompt Configuration',
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Icon(
                                                      Icons.play_circle_rounded,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Tab(
                                                    text: 'Starter Questions',
                                                  ),
                                                ],
                                              ),
                                            ],
                                            controller: _model.tabBarController,
                                            onTap: (i) async {
                                              [
                                                () async {},
                                                () async {},
                                                () async {},
                                                () async {}
                                              ][i]();
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            controller: _model.tabBarController,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 32.0, 0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final docs = _model
                                                            .details?.documents
                                                            ?.toList() ??
                                                        [];

                                                    return GridView.builder(
                                                      padding: EdgeInsets.zero,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 4,
                                                        crossAxisSpacing: 10.0,
                                                        mainAxisSpacing: 10.0,
                                                        childAspectRatio: 5.0,
                                                      ),
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: docs.length,
                                                      itemBuilder:
                                                          (context, docsIndex) {
                                                        final docsItem =
                                                            docs[docsIndex];
                                                        return Builder(
                                                          builder: (context) =>
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
                                                              showDialog(
                                                                barrierColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .loaderBg,
                                                                barrierDismissible:
                                                                    false,
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
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () =>
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus(),
                                                                      child:
                                                                          LoaderWidget(),
                                                                    ),
                                                                  );
                                                                },
                                                              );

                                                              _model.docExtractionResp =
                                                                  await TalkDocsGroup
                                                                      .getExtractedDocCall
                                                                      .call(
                                                                documentId: docsItem
                                                                    .documentId,
                                                              );

                                                              Navigator.pop(
                                                                  context);
                                                              if ((_model
                                                                      .docExtractionResp
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
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: () =>
                                                                            FocusScope.of(dialogContext).unfocus(),
                                                                        child:
                                                                            ViewExtractedDocsDialogWidget(
                                                                          documentName:
                                                                              docsItem.documentFilename,
                                                                          context: TalkDocsGroup
                                                                              .getExtractedDocCall
                                                                              .context(
                                                                            (_model.docExtractionResp?.jsonBody ??
                                                                                ''),
                                                                          )!,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Something went wrong!',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                  ),
                                                                );
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child:
                                                                DocumentActionCardWidget(
                                                              key: Key(
                                                                  'Keycyv_${docsIndex}_of_${docs.length}'),
                                                              fileName: docsItem
                                                                  .documentFilename,
                                                              showDelete: _model
                                                                      .details
                                                                      ?.readOnly !=
                                                                  '1',
                                                              isAddDocBtn: docsItem
                                                                  .isAddDocBtn,
                                                              deleteAction:
                                                                  () async {
                                                                var _shouldSetState =
                                                                    false;
                                                                if (_model
                                                                        .details
                                                                        ?.readOnly ==
                                                                    '1') {
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }

                                                                await showDialog(
                                                                  barrierDismissible:
                                                                      false,
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
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: () =>
                                                                            FocusScope.of(dialogContext).unfocus(),
                                                                        child:
                                                                            DeleteDocumentDialogWidget(
                                                                          document:
                                                                              docsItem,
                                                                          deleteSuccessCallback:
                                                                              () async {
                                                                            showDialog(
                                                                              barrierColor: FlutterFlowTheme.of(context).loaderBg,
                                                                              barrierDismissible: false,
                                                                              context: context,
                                                                              builder: (dialogContext) {
                                                                                return Dialog(
                                                                                  elevation: 0,
                                                                                  insetPadding: EdgeInsets.zero,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                  child: GestureDetector(
                                                                                    onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                    child: LoaderWidget(),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );

                                                                            _model.detailsAfterDeleteDoc =
                                                                                await TalkDocsGroup.projectDetailsCall.call(
                                                                              projectId: widget!.projectID,
                                                                              userId: currentUserEmail,
                                                                            );

                                                                            Navigator.pop(context);
                                                                            if ((_model.detailsAfterDeleteDoc?.succeeded ??
                                                                                true)) {
                                                                              _model.gotProjectDetails = true;
                                                                              _model.details = ProjectDetailStruct.maybeFromMap((_model.detailsAfterDeleteDoc?.jsonBody ?? ''));
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
                                                                            }
                                                                          },
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );

                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                              },
                                                              onAddClick:
                                                                  () async {
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
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: () =>
                                                                            FocusScope.of(dialogContext).unfocus(),
                                                                        child:
                                                                            UploadDocumentsDialogWidget(
                                                                          projectId:
                                                                              widget!.projectID,
                                                                          onDocumentAdded:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            showDialog(
                                                                              barrierColor: FlutterFlowTheme.of(context).loaderBg,
                                                                              barrierDismissible: false,
                                                                              context: context,
                                                                              builder: (dialogContext) {
                                                                                return Dialog(
                                                                                  elevation: 0,
                                                                                  insetPadding: EdgeInsets.zero,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                  child: GestureDetector(
                                                                                    onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                    child: Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 0.75,
                                                                                      child: LoaderWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );

                                                                            _model.projectDetailsRespAfterDocAdd =
                                                                                await TalkDocsGroup.projectDetailsCall.call(
                                                                              projectId: widget!.projectID,
                                                                              userId: currentUserEmail,
                                                                            );

                                                                            _shouldSetState =
                                                                                true;
                                                                            Navigator.pop(context);
                                                                            if ((_model.projectDetailsRespAfterDocAdd?.succeeded ??
                                                                                true)) {
                                                                              _model.gotProjectDetails = true;
                                                                              _model.details = ProjectDetailStruct.maybeFromMap((_model.projectDetailsRespAfterDocAdd?.jsonBody ?? ''));
                                                                              safeSetState(() {});
                                                                              if (_model.details?.readOnly != '1') {
                                                                                _model.updateDetailsStruct(
                                                                                  (e) => e
                                                                                    ..updateDocuments(
                                                                                      (e) => e.insert(
                                                                                          0,
                                                                                          DocumentsStruct(
                                                                                            isAddDocBtn: true,
                                                                                          )),
                                                                                    ),
                                                                                );
                                                                                safeSetState(() {});
                                                                              } else {
                                                                                return;
                                                                              }
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
                                                                          },
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 32.0, 0.0, 0.0),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Text(
                                                            'Project & User-specific Configuration',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'GoogleSans',
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel1,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Input Bucket/Folder',
                                                                      value:
                                                                          'gs://medical_data/pdf_folder',
                                                                      isDropdown:
                                                                          false,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      hasToolTip:
                                                                          false,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel2,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Customer Name',
                                                                      value:
                                                                          'Medical',
                                                                      isDropdown:
                                                                          false,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      hasToolTip:
                                                                          false,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 24.0)),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel3,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Customer Logo',
                                                                      value:
                                                                          'medical.png',
                                                                      isDropdown:
                                                                          false,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      hasToolTip:
                                                                          false,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel4,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Input File',
                                                                      value:
                                                                          'gs://medical_data/pdf_folder/allergy.pdf',
                                                                      isDropdown:
                                                                          false,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      hasToolTip:
                                                                          false,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 24.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 20.0)),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Text(
                                                            'Technical Configuration',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'GoogleSans',
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel5,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Model',
                                                                      value:
                                                                          'gemini-1.5-flash-001',
                                                                      isDropdown:
                                                                          true,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel6,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Scoring Model',
                                                                      value:
                                                                          'gemini-1.5-pro',
                                                                      isDropdown:
                                                                          true,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 24.0)),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel7,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Embedding',
                                                                      value:
                                                                          'textembedding-gecko@003',
                                                                      isDropdown:
                                                                          true,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel8,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Retriever',
                                                                      value:
                                                                          'vais',
                                                                      isDropdown:
                                                                          true,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel9,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Number of Previous/Next Segments',
                                                                      value:
                                                                          '1',
                                                                      isDropdown:
                                                                          true,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 24.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 20.0)),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Text(
                                                            'Personalization',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'GoogleSans',
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel10,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Temperature',
                                                                      value:
                                                                          '0.0',
                                                                      isDropdown:
                                                                          true,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel11,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Max Output Tokens',
                                                                      value:
                                                                          '4000',
                                                                      isDropdown:
                                                                          true,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel12,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Max Content Length',
                                                                      value:
                                                                          '1025000',
                                                                      isDropdown:
                                                                          true,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel13,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Max # of React Rounds',
                                                                      value:
                                                                          '2',
                                                                      isDropdown:
                                                                          true,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 24.0)),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel14,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Similar Question Number',
                                                                      value:
                                                                          '2',
                                                                      isDropdown:
                                                                          true,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel15,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Use Summarization',
                                                                      value:
                                                                          'True',
                                                                      isDropdown:
                                                                          true,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel16,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Use Relevance Scoring',
                                                                      value:
                                                                          'True',
                                                                      isDropdown:
                                                                          true,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel17,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Relevance Score Threshold',
                                                                      value:
                                                                          '2',
                                                                      isDropdown:
                                                                          true,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 24.0)),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel18,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Max Number of Docs Retrieved',
                                                                      value:
                                                                          '2',
                                                                      isDropdown:
                                                                          true,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel19,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Use MMR',
                                                                      value:
                                                                          'False',
                                                                      isDropdown:
                                                                          true,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel20,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Number of Parallel LLM Calls',
                                                                      value:
                                                                          '5',
                                                                      isDropdown:
                                                                          true,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel21,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Timeout for LLM Call',
                                                                      value:
                                                                          '15',
                                                                      isDropdown:
                                                                          true,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 24.0)),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel22,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Number of Previous Interactions',
                                                                      value:
                                                                          'gemini-1.5-flash-001',
                                                                      isDropdown:
                                                                          true,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .configFieldModel23,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ConfigFieldWidget(
                                                                      title:
                                                                          'Previous Conversation Relevance Threshold',
                                                                      value:
                                                                          'gemini-1.5-pro',
                                                                      isDropdown:
                                                                          true,
                                                                      viewDetailsAction:
                                                                          false,
                                                                      isReadOnly:
                                                                          true,
                                                                      onViewClick:
                                                                          () async {},
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 24.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 20.0)),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 30.0)),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 32.0, 0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final prompts = _model
                                                            .details
                                                            ?.promptConfiguration
                                                            ?.toList() ??
                                                        [];

                                                    return GridView.builder(
                                                      padding: EdgeInsets.zero,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        crossAxisSpacing: 24.0,
                                                        mainAxisSpacing: 24.0,
                                                        childAspectRatio: 1.8,
                                                      ),
                                                      primary: false,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: prompts.length,
                                                      itemBuilder: (context,
                                                          promptsIndex) {
                                                        final promptsItem =
                                                            prompts[
                                                                promptsIndex];
                                                        return Builder(
                                                          builder: (context) =>
                                                              ConfigFieldWidget(
                                                            key: Key(
                                                                'Key4a7_${promptsIndex}_of_${prompts.length}'),
                                                            title: promptsItem
                                                                .promptDisplayName,
                                                            value: promptsItem
                                                                .promptValue,
                                                            isDropdown: false,
                                                            viewDetailsAction:
                                                                true,
                                                            isReadOnly: false,
                                                            hasToolTip: false,
                                                            onViewClick:
                                                                () async {
                                                              await showDialog(
                                                                barrierDismissible:
                                                                    false,
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
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () =>
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus(),
                                                                      child:
                                                                          ViewPromptDialogWidget(
                                                                        projectId:
                                                                            widget!.projectID,
                                                                        promptDetail:
                                                                            promptsItem,
                                                                        isReadOnly:
                                                                            _model.details?.readOnly ==
                                                                                '1',
                                                                        onSavePromptSuccess:
                                                                            () async {
                                                                          showDialog(
                                                                            barrierColor:
                                                                                FlutterFlowTheme.of(context).loaderBg,
                                                                            barrierDismissible:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Dialog(
                                                                                elevation: 0,
                                                                                insetPadding: EdgeInsets.zero,
                                                                                backgroundColor: Colors.transparent,
                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                child: GestureDetector(
                                                                                  onTap: () => FocusScope.of(dialogContext).unfocus(),
                                                                                  child: LoaderWidget(),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );

                                                                          _model.detailsAfterPromptChange = await TalkDocsGroup
                                                                              .projectDetailsCall
                                                                              .call(
                                                                            projectId:
                                                                                widget!.projectID,
                                                                            userId:
                                                                                currentUserEmail,
                                                                          );

                                                                          Navigator.pop(
                                                                              context);
                                                                          if ((_model.detailsAfterPromptChange?.succeeded ??
                                                                              true)) {
                                                                            _model.gotProjectDetails =
                                                                                true;
                                                                            _model.details =
                                                                                ProjectDetailStruct.maybeFromMap((_model.detailsAfterPromptChange?.jsonBody ?? ''));
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
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 32.0, 0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final question = _model
                                                            .details?.questions
                                                            ?.toList() ??
                                                        [];

                                                    return GridView.builder(
                                                      padding: EdgeInsets.zero,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        crossAxisSpacing: 24.0,
                                                        mainAxisSpacing: 24.0,
                                                        childAspectRatio: 1.8,
                                                      ),
                                                      primary: false,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          question.length,
                                                      itemBuilder: (context,
                                                          questionIndex) {
                                                        final questionItem =
                                                            question[
                                                                questionIndex];
                                                        return ConfigFieldWidget(
                                                          key: Key(
                                                              'Keyejz_${questionIndex}_of_${question.length}'),
                                                          title:
                                                              'Starter Question ${(questionIndex + 1).toString()}',
                                                          value: questionItem,
                                                          isDropdown: false,
                                                          viewDetailsAction:
                                                              true,
                                                          isReadOnly: false,
                                                          hasToolTip: false,
                                                          onViewClick:
                                                              () async {
                                                            if (_model.details
                                                                    ?.readOnly ==
                                                                '1') {
                                                              return;
                                                            }
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed(
                                        'chatPage',
                                        queryParameters: {
                                          'projectId': serializeParam(
                                            widget!.projectID,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                    text: 'Go to Conversation',
                                    options: FFButtonOptions(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          60.0, 27.0, 60.0, 27.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF0B57D0),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Color(0xFFE1E1E1),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(60.0),
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(height: 40.0))
                                    .addToStart(SizedBox(height: 0.0)),
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
