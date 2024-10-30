import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'value_only_chip_model.dart';
export 'value_only_chip_model.dart';

class ValueOnlyChipWidget extends StatefulWidget {
  const ValueOnlyChipWidget({
    super.key,
    String? parameterTitle,
    String? parameterValue,
    required this.parameterIcon,
    required this.fillColor,
    required this.strokeColor,
    required this.textColor,
  })  : this.parameterTitle = parameterTitle ?? 'parameterTitle',
        this.parameterValue = parameterValue ?? 'parameterValue';

  final String parameterTitle;
  final String parameterValue;
  final Widget? parameterIcon;
  final Color? fillColor;
  final Color? strokeColor;
  final Color? textColor;

  @override
  State<ValueOnlyChipWidget> createState() => _ValueOnlyChipWidgetState();
}

class _ValueOnlyChipWidgetState extends State<ValueOnlyChipWidget> {
  late ValueOnlyChipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ValueOnlyChipModel());

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
        color: widget!.fillColor,
        borderRadius: BorderRadius.circular(86.0),
        border: Border.all(
          color: valueOrDefault<Color>(
            widget!.strokeColor,
            Color(0xFFE1E1E1),
          ),
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
              child: widget!.parameterIcon!,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 6.0, 0.0),
              child: Text(
                widget!.parameterTitle,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'GoogleSans',
                      color: widget!.textColor,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
              child: Text(
                widget!.parameterValue,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'GoogleSans',
                      color: widget!.textColor,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
