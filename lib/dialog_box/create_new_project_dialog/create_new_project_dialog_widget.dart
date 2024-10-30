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
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_new_project_dialog_model.dart';
export 'create_new_project_dialog_model.dart';

class CreateNewProjectDialogWidget extends StatefulWidget {
  const CreateNewProjectDialogWidget({super.key});

  @override
  State<CreateNewProjectDialogWidget> createState() =>
      _CreateNewProjectDialogWidgetState();
}

class _CreateNewProjectDialogWidgetState
    extends State<CreateNewProjectDialogWidget> {
  late CreateNewProjectDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateNewProjectDialogModel());

    _model.projectNameFieldTextController ??= TextEditingController();
    _model.projectNameFieldFocusNode ??= FocusNode();

    _model.questionField1TextController ??= TextEditingController();
    _model.questionField1FocusNode ??= FocusNode();

    _model.questionField2TextController ??= TextEditingController();
    _model.questionField2FocusNode ??= FocusNode();

    _model.questionField3TextController ??= TextEditingController();
    _model.questionField3FocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        width: 500.0,
        height: 800.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.folder_rounded,
                    color: Color(0xFF939393),
                    size: 24.0,
                  ),
                  Text(
                    'Create New Project',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'GoogleSans',
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  controller: _model.columnController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 10.0),
                        child: Text(
                          'Project Name(*)',
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      TextFormField(
                        controller: _model.projectNameFieldTextController,
                        focusNode: _model.projectNameFieldFocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Project Name',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'GoogleSans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).textFieldBg,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'GoogleSans',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator: _model
                            .projectNameFieldTextControllerValidator
                            .asValidator(context),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 10.0),
                        child: Text(
                          'Initial Questions',
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      TextFormField(
                        controller: _model.questionField1TextController,
                        focusNode: _model.questionField1FocusNode,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Enter Question 1',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'GoogleSans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: false,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.of(context).textFieldBg,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'GoogleSans',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator: _model.questionField1TextControllerValidator
                            .asValidator(context),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: TextFormField(
                          controller: _model.questionField2TextController,
                          focusNode: _model.questionField2FocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Enter Question 2',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'GoogleSans',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context).textFieldBg,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'GoogleSans',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model
                              .questionField2TextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: TextFormField(
                          controller: _model.questionField3TextController,
                          focusNode: _model.questionField3FocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Enter Question 3',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'GoogleSans',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context).textFieldBg,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'GoogleSans',
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model
                              .questionField3TextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Upload Documents(*)',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'GoogleSans',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                _model.returnedDocs =
                                    await actions.documentPicker(
                                  _model.docsToUpload.toList(),
                                );
                                _model.docsToUpload = _model.returnedDocs!
                                    .toList()
                                    .cast<FFUploadedFile>();
                                safeSetState(() {});
                                await _model.gridViewController?.animateTo(
                                  _model.gridViewController!.position
                                      .maxScrollExtent,
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.ease,
                                );

                                safeSetState(() {});
                              },
                              text: 'Select Document(s)',
                              icon: Icon(
                                Icons.cloud_upload_outlined,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .secondryButtonBg,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'GoogleSans',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 300.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).textFieldBg,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Builder(
                          builder: (context) {
                            if (_model.docsToUpload.isNotEmpty) {
                              return Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Builder(
                                  builder: (context) {
                                    final selectedFiles =
                                        _model.docsToUpload.toList();

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 5.0,
                                      ),
                                      primary: false,
                                      scrollDirection: Axis.vertical,
                                      itemCount: selectedFiles.length,
                                      itemBuilder:
                                          (context, selectedFilesIndex) {
                                        final selectedFilesItem =
                                            selectedFiles[selectedFilesIndex];
                                        return DocumentActionCardWidget(
                                          key: Key(
                                              'Keyn6s_${selectedFilesIndex}_of_${selectedFiles.length}'),
                                          fileName: functions
                                              .getFileName(selectedFilesItem)!,
                                          showDelete: true,
                                          deleteAction: () async {
                                            _model
                                                .removeAtIndexFromDocsToUpload(
                                                    selectedFilesIndex);
                                            safeSetState(() {});
                                          },
                                          onAddClick: () async {},
                                        );
                                      },
                                      controller: _model.gridViewController,
                                    );
                                  },
                                ),
                              );
                            } else {
                              return Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'No Documents Uploaded!',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'GoogleSans',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ].addToEnd(SizedBox(height: 30.0)),
                  ),
                ),
              ),
            ),
            if (_model.errorVisibility)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
                child: Text(
                  _model.errMsg,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'GoogleSans',
                        color: FlutterFlowTheme.of(context).error,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 16.0),
              child: FFButtonWidget(
                onPressed: () async {
                  var _shouldSetState = false;
                  if ((_model.projectNameFieldTextController.text != null &&
                          _model.projectNameFieldTextController.text != '') &&
                      (_model.docsToUpload.isNotEmpty)) {
                    _model.errorVisibility = false;
                    safeSetState(() {});
                    _model.addToQuestionsList(
                        _model.questionField1TextController.text);
                    safeSetState(() {});
                    _model.addToQuestionsList(
                        _model.questionField2TextController.text);
                    safeSetState(() {});
                    _model.addToQuestionsList(
                        _model.questionField3TextController.text);
                    safeSetState(() {});
                    _model.questionsList = _model.questionsList
                        .where((e) => e != null && e != '')
                        .toList()
                        .cast<String>();
                    safeSetState(() {});
                  } else {
                    _model.errMsg = 'Project name and documents are required!';
                    _model.errorVisibility = true;
                    safeSetState(() {});
                    if (_shouldSetState) safeSetState(() {});
                    return;
                  }

                  _model.createProjectResp =
                      await TalkDocsGroup.createProjectCall.call(
                    projectName: _model.projectNameFieldTextController.text,
                    userId: currentUserEmail,
                    filesList: _model.docsToUpload,
                    questions: functions.getQuestionsJsonFromList(
                        _model.questionsList.toList()),
                  );

                  _shouldSetState = true;
                  if ((_model.createProjectResp?.succeeded ?? true)) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Project created successfully!',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                    FFAppState().projectID =
                        CreateProjectResponseModelStruct.maybeFromMap(
                                (_model.createProjectResp?.jsonBody ?? ''))!
                            .clientProjectId;
                    FFAppState().selectedMenu = 1;
                    safeSetState(() {});
                  } else {
                    _model.errMsg = 'Something went wrong!';
                    _model.errorVisibility = true;
                    safeSetState(() {});
                    if (_shouldSetState) safeSetState(() {});
                    return;
                  }

                  context.pushNamed(
                    'chatPage',
                    queryParameters: {
                      'projectId': serializeParam(
                        CreateProjectResponseModelStruct.maybeFromMap(
                                (_model.createProjectResp?.jsonBody ?? ''))
                            ?.clientProjectId,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );

                  if (_shouldSetState) safeSetState(() {});
                },
                text: 'Create Project',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'GoogleSans',
                        color: FlutterFlowTheme.of(context).info,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
