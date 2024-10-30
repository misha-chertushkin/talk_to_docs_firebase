import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'debug_screen_item_model.dart';
export 'debug_screen_item_model.dart';

class DebugScreenItemWidget extends StatefulWidget {
  const DebugScreenItemWidget({
    super.key,
    String? title,
    String? text,
  })  : this.title = title ?? '',
        this.text = text ?? '';

  final String title;
  final String text;

  @override
  State<DebugScreenItemWidget> createState() => _DebugScreenItemWidgetState();
}

class _DebugScreenItemWidgetState extends State<DebugScreenItemWidget> {
  late DebugScreenItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DebugScreenItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget!.title,
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'GoogleSans',
                    color: Color(0xFF939393),
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
              child: Container(
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).accent4,
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: SelectionArea(
                        child: Text(
                      widget!.text,
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'GoogleSans',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    )),
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
