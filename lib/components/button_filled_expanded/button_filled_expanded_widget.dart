import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_filled_expanded_model.dart';
export 'button_filled_expanded_model.dart';

class ButtonFilledExpandedWidget extends StatefulWidget {
  const ButtonFilledExpandedWidget({
    super.key,
    this.buttonText,
    required this.leadingButtonIcon,
  });

  final String? buttonText;
  final Widget? leadingButtonIcon;

  @override
  State<ButtonFilledExpandedWidget> createState() =>
      _ButtonFilledExpandedWidgetState();
}

class _ButtonFilledExpandedWidgetState
    extends State<ButtonFilledExpandedWidget> {
  late ButtonFilledExpandedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonFilledExpandedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0B57D0),
        borderRadius: BorderRadius.circular(100.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Color(0xFFE1E1E1),
          width: 2.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!FFAppState().navOpen)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          if (FFAppState().navOpen)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(45.0, 16.0, 45.0, 16.0),
              child: Text(
                valueOrDefault<String>(
                  widget!.buttonText,
                  'Create New Project',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'GoogleSans',
                      color: FlutterFlowTheme.of(context).info,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
