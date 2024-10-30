import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'small_action_model.dart';
export 'small_action_model.dart';

class SmallActionWidget extends StatefulWidget {
  const SmallActionWidget({super.key});

  @override
  State<SmallActionWidget> createState() => _SmallActionWidgetState();
}

class _SmallActionWidgetState extends State<SmallActionWidget> {
  late SmallActionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SmallActionModel());

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
      height: 150.0,
      decoration: BoxDecoration(
        color: Color(0xFFFEEFC3),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Color(0xFFFCC934),
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(140.0, 36.0, 140.0, 36.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
              'https://lottie.host/73d1b421-ac7f-4a87-a7b6-c9bd6dbdb978/4UXMC7yqgK.json',
              width: 100.0,
              height: 80.0,
              fit: BoxFit.contain,
              animate: true,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You do not have an Active Project',
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'GoogleSans',
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: false,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Create a new project',
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'GoogleSans',
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: false,
                              ),
                    ),
                    Text(
                      ' to start Talking to Docs!',
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'GoogleSans',
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: false,
                              ),
                    ),
                  ],
                ),
              ],
            ),
          ].divide(SizedBox(width: 80.0)),
        ),
      ),
    );
  }
}
