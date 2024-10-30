import '/auth/firebase_auth/auth_util.dart';
import '/components/secondary_action_button/secondary_action_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_profile_dialog_model.dart';
export 'user_profile_dialog_model.dart';

class UserProfileDialogWidget extends StatefulWidget {
  const UserProfileDialogWidget({super.key});

  @override
  State<UserProfileDialogWidget> createState() =>
      _UserProfileDialogWidgetState();
}

class _UserProfileDialogWidgetState extends State<UserProfileDialogWidget> {
  late UserProfileDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserProfileDialogModel());

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
      padding: EdgeInsets.all(12.0),
      child: Material(
        color: Colors.transparent,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          width: 400.0,
          height: 360.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x34090F13),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(),
                    ),
                    AuthUserStreamWidget(
                      builder: (context) => Text(
                        currentUserDisplayName,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'GoogleSans',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.close_rounded,
                          color: Color(0xFF939393),
                          size: 24.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF0F4F9),
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                      color: Color(0xFFD6D8D9),
                      width: 2.0,
                    ),
                  ),
                  child: AuthUserStreamWidget(
                    builder: (context) => Hero(
                      tag: currentUserPhoto,
                      transitionOnUserGestures: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 100),
                          fadeOutDuration: Duration(milliseconds: 100),
                          imageUrl: currentUserPhoto,
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.contain,
                          errorWidget: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/error_image.png',
                            width: 80.0,
                            height: 80.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                AuthUserStreamWidget(
                  builder: (context) => Text(
                    'Hi, ${currentUserDisplayName}!',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'GoogleSans',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Container(
                  height: 24.0,
                  decoration: BoxDecoration(),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(60.0, 0.0, 60.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      context.goNamedAuth('LoginFirebase', context.mounted);
                    },
                    child: wrapWithModel(
                      model: _model.secondaryActionButtonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: SecondaryActionButtonWidget(
                        actionName: 'Logout',
                        actionIcon: Icon(
                          Icons.logout_rounded,
                          color: Color(0xFFEA4335),
                          size: 24.0,
                        ),
                        actionIconColor: Color(0xFFEA4335),
                        hasIcon: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
