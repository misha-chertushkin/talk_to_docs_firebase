import '/auth/firebase_auth/auth_util.dart';
import '/dialog_box/user_profile_dialog/user_profile_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_avatar_model.dart';
export 'user_avatar_model.dart';

class UserAvatarWidget extends StatefulWidget {
  const UserAvatarWidget({super.key});

  @override
  State<UserAvatarWidget> createState() => _UserAvatarWidgetState();
}

class _UserAvatarWidgetState extends State<UserAvatarWidget> {
  late UserAvatarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserAvatarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          showAlignedDialog(
            barrierColor: Colors.transparent,
            context: context,
            isGlobal: false,
            avoidOverflow: false,
            targetAnchor: AlignmentDirectional(-9.0, 11.0)
                .resolve(Directionality.of(context)),
            followerAnchor: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            builder: (dialogContext) {
              return Material(
                color: Colors.transparent,
                child: UserProfileDialogWidget(),
              );
            },
          );
        },
        child: Container(
          width: 40.0,
          height: 40.0,
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
                borderRadius: BorderRadius.circular(20.0),
                child: CachedNetworkImage(
                  fadeInDuration: Duration(milliseconds: 100),
                  fadeOutDuration: Duration(milliseconds: 100),
                  imageUrl: currentUserPhoto,
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.contain,
                  errorWidget: (context, error, stackTrace) => Image.asset(
                    'assets/images/error_image.png',
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
