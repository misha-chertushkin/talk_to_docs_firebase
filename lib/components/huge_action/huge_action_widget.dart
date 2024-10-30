import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'huge_action_model.dart';
export 'huge_action_model.dart';

class HugeActionWidget extends StatefulWidget {
  const HugeActionWidget({super.key});

  @override
  State<HugeActionWidget> createState() => _HugeActionWidgetState();
}

class _HugeActionWidgetState extends State<HugeActionWidget> {
  late HugeActionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HugeActionModel());

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 400.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(300.0, 80.0, 300.0, 80.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.network(
              'https://lottie.host/91b0ef39-8a67-4ef1-b06f-f5a2666ff61e/WkMR9vDwAD.json',
              width: 150.0,
              height: 150.0,
              fit: BoxFit.contain,
              animate: true,
            ),
            Text(
              'Create a new project',
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    fontFamily: 'GoogleSans',
                    fontSize: 30.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    useGoogleFonts: false,
                  ),
            ),
          ].divide(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
