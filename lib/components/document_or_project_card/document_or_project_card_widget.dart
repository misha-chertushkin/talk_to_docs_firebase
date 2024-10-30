import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'document_or_project_card_model.dart';
export 'document_or_project_card_model.dart';

class DocumentOrProjectCardWidget extends StatefulWidget {
  const DocumentOrProjectCardWidget({
    super.key,
    String? documentorProjectName,
    required this.icon,
  }) : this.documentorProjectName = documentorProjectName ?? 'documentName.pdf';

  final String documentorProjectName;
  final Widget? icon;

  @override
  State<DocumentOrProjectCardWidget> createState() =>
      _DocumentOrProjectCardWidgetState();
}

class _DocumentOrProjectCardWidgetState
    extends State<DocumentOrProjectCardWidget> {
  late DocumentOrProjectCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DocumentOrProjectCardModel());

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
        color: FlutterFlowTheme.of(context).secondryButtonBg,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget!.icon!,
            Text(
              widget!.documentorProjectName,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'GoogleSans',
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ].divide(SizedBox(width: 12.0)),
        ),
      ),
    );
  }
}
