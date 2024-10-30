import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'project_dropdown_model.dart';
export 'project_dropdown_model.dart';

class ProjectDropdownWidget extends StatefulWidget {
  const ProjectDropdownWidget({
    super.key,
    required this.projectList,
    required this.onProjectClick,
  });

  final List<dynamic>? projectList;
  final Future Function(String projectId)? onProjectClick;

  @override
  State<ProjectDropdownWidget> createState() => _ProjectDropdownWidgetState();
}

class _ProjectDropdownWidgetState extends State<ProjectDropdownWidget> {
  late ProjectDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProjectDropdownModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      constraints: BoxConstraints(
        minHeight: 10.0,
        maxHeight: MediaQuery.sizeOf(context).height * 0.4,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 0.0),
            child: Text(
              'List of Projects',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'GoogleSans',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 12.0),
              child: Builder(
                builder: (context) {
                  final project = widget!.projectList!.toList();

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: project.length,
                    itemBuilder: (context, projectIndex) {
                      final projectItem = project[projectIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await widget.onProjectClick?.call(
                              getJsonField(
                                projectItem,
                                r'''$.project_id''',
                              ).toString(),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 8.0, 0.0, 8.0),
                              child: Text(
                                getJsonField(
                                  projectItem,
                                  r'''$.project_name''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'GoogleSans',
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
