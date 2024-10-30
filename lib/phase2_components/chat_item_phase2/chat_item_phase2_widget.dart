import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/phase2_components/user_feedback_dislike/user_feedback_dislike_widget.dart';
import '/phase2_components/user_feedback_like/user_feedback_like_widget.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_item_phase2_model.dart';
export 'chat_item_phase2_model.dart';

class ChatItemPhase2Widget extends StatefulWidget {
  const ChatItemPhase2Widget({
    super.key,
    required this.chat,
    required this.index,
  });

  final ChatStruct? chat;
  final int? index;

  @override
  State<ChatItemPhase2Widget> createState() => _ChatItemPhase2WidgetState();
}

class _ChatItemPhase2WidgetState extends State<ChatItemPhase2Widget> {
  late ChatItemPhase2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatItemPhase2Model());

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(48.0),
                child: Image.network(
                  'https://picsum.photos/seed/80/600',
                  width: 48.0,
                  height: 48.0,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                  child: AutoSizeText(
                    widget!.chat!.message.maybeHandleOverflow(
                      maxChars: 800,
                      replacement: '…',
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'GoogleSans',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
            ].divide(SizedBox(width: 16.0)),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(56.0, 0.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Builder(
                  builder: (context) => FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 0.0,
                    borderWidth: 0.0,
                    buttonSize: 40.0,
                    hoverIconColor: Color(0xFF1A73E8),
                    icon: Icon(
                      Icons.thumb_up,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 18.0,
                    ),
                    onPressed: () async {
                      await showAlignedDialog(
                        context: context,
                        isGlobal: false,
                        avoidOverflow: false,
                        targetAnchor: AlignmentDirectional(2.0, 2.0)
                            .resolve(Directionality.of(context)),
                        followerAnchor: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        builder: (dialogContext) {
                          return Material(
                            color: Colors.transparent,
                            child: UserFeedbackLikeWidget(),
                          );
                        },
                      );
                    },
                  ),
                ),
                Builder(
                  builder: (context) => FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 0.0,
                    buttonSize: 40.0,
                    hoverIconColor: Color(0xFF1A73E8),
                    icon: Icon(
                      Icons.thumb_down,
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 18.0,
                    ),
                    onPressed: () async {
                      await showAlignedDialog(
                        context: context,
                        isGlobal: false,
                        avoidOverflow: false,
                        targetAnchor: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        followerAnchor: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        builder: (dialogContext) {
                          return Material(
                            color: Colors.transparent,
                            child: UserFeedbackDislikeWidget(),
                          );
                        },
                      );
                    },
                  ),
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 0.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.share,
                    color: Color(0xFF0B57D0),
                    size: 18.0,
                  ),
                  onPressed: () {
                    print('IconButtonShare pressed ...');
                  },
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () {
                    print('debugResponse pressed ...');
                  },
                  text: 'Debug',
                  icon: Icon(
                    Icons.bug_report,
                    size: 18.0,
                  ),
                  options: FFButtonOptions(
                    height: 34.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                    color: Colors.white,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
              ],
            ),
          ),
        ].divide(SizedBox(height: 20.0)),
      ),
    );
  }
}
