import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'secondary_action_button_model.dart';
export 'secondary_action_button_model.dart';

class SecondaryActionButtonWidget extends StatefulWidget {
  const SecondaryActionButtonWidget({
    super.key,
    String? actionName,
    this.actionIcon,
    Color? actionIconColor,
    required this.hasIcon,
  })  : this.actionName = actionName ?? 'Create New',
        this.actionIconColor = actionIconColor ?? const Color(0xFF717171);

  final String actionName;
  final Widget? actionIcon;
  final Color actionIconColor;
  final bool? hasIcon;

  @override
  State<SecondaryActionButtonWidget> createState() =>
      _SecondaryActionButtonWidgetState();
}

class _SecondaryActionButtonWidgetState
    extends State<SecondaryActionButtonWidget> {
  late SecondaryActionButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SecondaryActionButtonModel());

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
        borderRadius: BorderRadius.circular(100.0),
        border: Border.all(
          color: Color(0xFFC4C4C4),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget!.hasIcon ?? true)
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
                      color: widget!.actionIconColor,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: false,
                    ),
              ),
            ),
          ].divide(SizedBox(width: 12.0)),
        ),
      ),
    );
  }
}
