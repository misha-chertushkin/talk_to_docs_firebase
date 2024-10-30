import '/components/button_filled_expanded/button_filled_expanded_widget.dart';
import '/components/individual_menu_item_expanded/individual_menu_item_expanded_widget.dart';
import '/dialog_box/create_new_project_dialog/create_new_project_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'menu_bar_widget.dart' show MenuBarWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuBarModel extends FlutterFlowModel<MenuBarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for individualMenuItemExpanded component.
  late IndividualMenuItemExpandedModel individualMenuItemExpandedModel1;
  // Model for individualMenuItemExpanded component.
  late IndividualMenuItemExpandedModel individualMenuItemExpandedModel2;
  // Model for buttonFilledExpanded component.
  late ButtonFilledExpandedModel buttonFilledExpandedModel;

  @override
  void initState(BuildContext context) {
    individualMenuItemExpandedModel1 =
        createModel(context, () => IndividualMenuItemExpandedModel());
    individualMenuItemExpandedModel2 =
        createModel(context, () => IndividualMenuItemExpandedModel());
    buttonFilledExpandedModel =
        createModel(context, () => ButtonFilledExpandedModel());
  }

  @override
  void dispose() {
    individualMenuItemExpandedModel1.dispose();
    individualMenuItemExpandedModel2.dispose();
    buttonFilledExpandedModel.dispose();
  }
}
