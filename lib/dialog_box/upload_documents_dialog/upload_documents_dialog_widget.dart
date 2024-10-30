import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/document_action_card/document_action_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'upload_documents_dialog_model.dart';
export 'upload_documents_dialog_model.dart';

class UploadDocumentsDialogWidget extends StatefulWidget {
  const UploadDocumentsDialogWidget({
    super.key,
    required this.projectId,
    required this.onDocumentAdded,
  });

  final String? projectId;
  final Future Function()? onDocumentAdded;

  @override
  State<UploadDocumentsDialogWidget> createState() =>
      _UploadDocumentsDialogWidgetState();
}

class _UploadDocumentsDialogWidgetState
    extends State<UploadDocumentsDialogWidget> {
  late UploadDocumentsDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadDocumentsDialogModel());

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
                    Icons.insert_drive_file,
                    color: Color(0xFF939393),
                    size: 24.0,
                  ),
                  Text(
                    'Upload Documents',
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upload Document(s)',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'GoogleSans',
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        _model.returnedDocs = await actions.documentPicker(
                          _model.docsToUpload.toList(),
                        );
                        _model.docsToUpload = _model.returnedDocs!
                            .toList()
                            .cast<FFUploadedFile>();
                        safeSetState(() {});
                        await _model.gridViewController?.animateTo(
                          _model.gridViewController!.position.maxScrollExtent,
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
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondryButtonBg,
                        textStyle:
                            FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'GoogleSans',
                                  color: FlutterFlowTheme.of(context).primary,
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
                            final selectedFiles = _model.docsToUpload.toList();

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
                              itemBuilder: (context, selectedFilesIndex) {
                                final selectedFilesItem =
                                    selectedFiles[selectedFilesIndex];
                                return DocumentActionCardWidget(
                                  key: Key(
                                      'Keyod1_${selectedFilesIndex}_of_${selectedFiles.length}'),
                                  fileName:
                                      functions.getFileName(selectedFilesItem)!,
                                  showDelete: true,
                                  deleteAction: () async {
                                    _model.removeAtIndexFromDocsToUpload(
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      );
                    }
                  },
                ),
              ),
              if (_model.errorVisibility)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: !(_model.docsToUpload.isNotEmpty)
                      ? null
                      : () async {
                          var _shouldSetState = false;
                          _model.uploadDocResp =
                              await TalkDocsGroup.uploadFilesToProjectCall.call(
                            userId: currentUserEmail,
                            clientProjectId: widget!.projectId,
                            filesList: _model.docsToUpload,
                          );

                          _shouldSetState = true;
                          if ((_model.uploadDocResp?.succeeded ?? true)) {
                            Navigator.pop(context);
                            await widget.onDocumentAdded?.call();
                          } else {
                            _model.errMsg = 'Something went wrong!';
                            _model.errorVisibility = true;
                            safeSetState(() {});
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }

                          if (_shouldSetState) safeSetState(() {});
                        },
                  text: 'Upload Documents',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                    disabledColor: FlutterFlowTheme.of(context).alternate,
                    disabledTextColor:
                        FlutterFlowTheme.of(context).secondaryText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
