import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/document_or_project_card/document_or_project_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'duplicate_project_dialog_model.dart';
export 'duplicate_project_dialog_model.dart';

class DuplicateProjectDialogWidget extends StatefulWidget {
  const DuplicateProjectDialogWidget({super.key});

  @override
  State<DuplicateProjectDialogWidget> createState() =>
      _DuplicateProjectDialogWidgetState();
}

class _DuplicateProjectDialogWidgetState
    extends State<DuplicateProjectDialogWidget> {
  late DuplicateProjectDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DuplicateProjectDialogModel());

    _model.projectNameFieldTextController ??= TextEditingController();
    _model.projectNameFieldFocusNode ??= FocusNode();

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
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.folder_rounded,
                    color: Color(0xFF939393),
                    size: 24.0,
                  ),
                  Text(
                    'Duplicate Project',
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
              Divider(
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Text(
                  'You are attempting to duplicate this project',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'GoogleSans',
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: wrapWithModel(
                  model: _model.documentOrProjectCardModel,
                  updateCallback: () => safeSetState(() {}),
                  child: DocumentOrProjectCardWidget(
                    documentorProjectName: 'Project Name',
                    icon: Icon(
                      Icons.folder,
                      color: Color(0xFF0B57D0),
                      size: 24.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
                child: Text(
                  'New Project Name',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'GoogleSans',
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: TextFormField(
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
                    fillColor: FlutterFlowTheme.of(context).info,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'GoogleSans',
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator: _model.projectNameFieldTextControllerValidator
                      .asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        var _shouldSetState = false;
                        if ((_model.projectNameFieldTextController.text !=
                                    null &&
                                _model.projectNameFieldTextController.text !=
                                    '') &&
                            (_model.docsToUpload.isNotEmpty)) {
                          _model.errorVisibility = false;
                          safeSetState(() {});
                        } else {
                          _model.errMsg = 'All fields are required!';
                          _model.errorVisibility = true;
                          safeSetState(() {});
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }

                        _model.createProjectResp =
                            await TalkDocsGroup.createProjectCall.call(
                          projectName:
                              _model.projectNameFieldTextController.text,
                          userId: currentUserEmail,
                          filesList: _model.docsToUpload,
                        );

                        _shouldSetState = true;
                        if ((_model.createProjectResp?.succeeded ?? true)) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Project Created Successfully!',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          FFAppState().projectID =
                              CreateProjectResponseModelStruct.maybeFromMap(
                                      (_model.createProjectResp?.jsonBody ??
                                          ''))!
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
                              '',
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );

                        if (_shouldSetState) safeSetState(() {});
                      },
                      text: 'Cancel',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.white,
                        textStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'GoogleSans',
                                  color: Color(0xFF0B57D0),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Color(0xFFC1C1C1),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Duplicate Project',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF0B57D0),
                        textStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'GoogleSans',
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: false,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ].divide(SizedBox(width: 24.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
