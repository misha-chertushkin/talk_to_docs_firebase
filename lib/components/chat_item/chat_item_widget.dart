import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_item_model.dart';
export 'chat_item_model.dart';

class ChatItemWidget extends StatefulWidget {
  const ChatItemWidget({
    super.key,
    required this.chat,
    required this.index,
    bool? showDebug,
    required this.onDebugClick,
    bool? sendingChat,
  })  : this.showDebug = showDebug ?? false,
        this.sendingChat = sendingChat ?? false;

  final ChatStruct? chat;
  final int? index;
  final bool showDebug;
  final Future Function()? onDebugClick;
  final bool sendingChat;

  @override
  State<ChatItemWidget> createState() => _ChatItemWidgetState();
}

class _ChatItemWidgetState extends State<ChatItemWidget> {
  late ChatItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatItemModel());

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
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthUserStreamWidget(
                builder: (context) => ClipRRect(
                  borderRadius: BorderRadius.circular(48.0),
                  child: Image.network(
                    widget!.chat!.isAi
                        ? 'https://www.gstatic.com/images/branding/productlogos/gemini/v4/web-96dp/logo_gemini_color_1x_web_96dp.png'
                        : currentUserPhoto,
                    width: 48.0,
                    height: 48.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 160.0, 0.0),
                    child: SelectionArea(
                        child: Text(
                      widget!.chat!.message,
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
            ].divide(SizedBox(width: 16.0)),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(64.0, 0.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (widget!.showDebug)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 24.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await widget.onDebugClick?.call();
                      },
                      text: 'Debug',
                      icon: Icon(
                        Icons.bug_report,
                        size: 18.0,
                      ),
                      options: FFButtonOptions(
                        height: 34.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                        color: Colors.white,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'GoogleSans',
                                  color: Color(0xFF0B57D0),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Color(0xFFC1C1C1),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(100.0),
                        hoverColor: Color(0xFF0B57D0),
                        hoverBorderSide: BorderSide(
                          color: Color(0xFF0B57D0),
                          width: 1.0,
                        ),
                        hoverTextColor: Colors.white,
                      ),
                    ),
                  ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(),
                  ),
                ),
              ],
            ),
          ),
        ].divide(SizedBox(height: 4.0)),
      ),
    );
  }
}
