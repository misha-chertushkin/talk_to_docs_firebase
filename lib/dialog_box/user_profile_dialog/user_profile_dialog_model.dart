import '/auth/firebase_auth/auth_util.dart';
import '/components/secondary_action_button/secondary_action_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_profile_dialog_widget.dart' show UserProfileDialogWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserProfileDialogModel extends FlutterFlowModel<UserProfileDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for secondaryActionButton component.
  late SecondaryActionButtonModel secondaryActionButtonModel;

  @override
  void initState(BuildContext context) {
    secondaryActionButtonModel =
        createModel(context, () => SecondaryActionButtonModel());
  }

  @override
  void dispose() {
    secondaryActionButtonModel.dispose();
  }
}
