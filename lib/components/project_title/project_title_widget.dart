import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'project_title_model.dart';
export 'project_title_model.dart';

class ProjectTitleWidget extends StatefulWidget {
  const ProjectTitleWidget({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  State<ProjectTitleWidget> createState() => _ProjectTitleWidgetState();
}

class _ProjectTitleWidgetState extends State<ProjectTitleWidget> {
  late ProjectTitleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProjectTitleModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: AutoSizeText(
                widget!.title!.maybeHandleOverflow(
                  maxChars: 22,
                  replacement: '…',
                ),
                maxLines: 1,
                minFontSize: 20.0,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'GoogleSans',
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_drop_down,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
          ),
        ].divide(SizedBox(width: 10.0)),
      ),
    );
  }
}
