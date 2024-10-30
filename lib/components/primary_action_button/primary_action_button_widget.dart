import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'primary_action_button_model.dart';
export 'primary_action_button_model.dart';

class PrimaryActionButtonWidget extends StatefulWidget {
  const PrimaryActionButtonWidget({
    super.key,
    String? actionName,
    this.actionIcon,
  }) : this.actionName = actionName ?? 'Create New';

  final String actionName;
  final Widget? actionIcon;

  @override
  State<PrimaryActionButtonWidget> createState() =>
      _PrimaryActionButtonWidgetState();
}

class _PrimaryActionButtonWidgetState extends State<PrimaryActionButtonWidget> {
  late PrimaryActionButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrimaryActionButtonModel());

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
        color: Color(0xFF0B57D0),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 0.0, 0.0),
              child: widget!.actionIcon!,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
              child: Text(
                widget!.actionName,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'GoogleSans',
                      color: FlutterFlowTheme.of(context).info,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: false,
                    ),
              ),
            ),
          ].divide(SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}
