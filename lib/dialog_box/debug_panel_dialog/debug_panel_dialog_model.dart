import '/components/debug_screen_item/debug_screen_item_widget.dart';
import '/components/document_or_project_card/document_or_project_card_widget.dart';
import '/components/value_only_chip/value_only_chip_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'debug_panel_dialog_widget.dart' show DebugPanelDialogWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DebugPanelDialogModel extends FlutterFlowModel<DebugPanelDialogWidget> {
  ///  Local state fields for this component.

  int? selectedRoundIndex = 0;

  List<int> roundList = [1, 2, 3, 4, 5];
  void addToRoundList(int item) => roundList.add(item);
  void removeFromRoundList(int item) => roundList.remove(item);
  void removeAtIndexFromRoundList(int index) => roundList.removeAt(index);
  void insertAtIndexInRoundList(int index, int item) =>
      roundList.insert(index, item);
  void updateRoundListAtIndex(int index, Function(int) updateFn) =>
      roundList[index] = updateFn(roundList[index]);

  ///  State fields for stateful widgets in this component.

  // Model for valueOnlyChip component.
  late ValueOnlyChipModel valueOnlyChipModel1;
  // Model for valueOnlyChip component.
  late ValueOnlyChipModel valueOnlyChipModel2;
  // Model for debugScreenItem component.
  late DebugScreenItemModel debugScreenItemModel1;
  // Model for debugScreenItem component.
  late DebugScreenItemModel debugScreenItemModel2;
  // Model for debugScreenItem component.
  late DebugScreenItemModel debugScreenItemModel3;
  // Model for valueOnlyChip component.
  late ValueOnlyChipModel valueOnlyChipModel3;
  // Model for valueOnlyChip component.
  late ValueOnlyChipModel valueOnlyChipModel4;
  // Model for debugScreenItem component.
  late DebugScreenItemModel debugScreenItemModel4;
  // Model for debugScreenItem component.
  late DebugScreenItemModel debugScreenItemModel5;
  // Model for debugScreenItem component.
  late DebugScreenItemModel debugScreenItemModel6;
  // Model for debugScreenItem component.
  late DebugScreenItemModel debugScreenItemModel7;
  // Model for debugScreenItem component.
  late DebugScreenItemModel debugScreenItemModel8;

  @override
  void initState(BuildContext context) {
    valueOnlyChipModel1 = createModel(context, () => ValueOnlyChipModel());
    valueOnlyChipModel2 = createModel(context, () => ValueOnlyChipModel());
    debugScreenItemModel1 = createModel(context, () => DebugScreenItemModel());
    debugScreenItemModel2 = createModel(context, () => DebugScreenItemModel());
    debugScreenItemModel3 = createModel(context, () => DebugScreenItemModel());
    valueOnlyChipModel3 = createModel(context, () => ValueOnlyChipModel());
    valueOnlyChipModel4 = createModel(context, () => ValueOnlyChipModel());
    debugScreenItemModel4 = createModel(context, () => DebugScreenItemModel());
    debugScreenItemModel5 = createModel(context, () => DebugScreenItemModel());
    debugScreenItemModel6 = createModel(context, () => DebugScreenItemModel());
    debugScreenItemModel7 = createModel(context, () => DebugScreenItemModel());
    debugScreenItemModel8 = createModel(context, () => DebugScreenItemModel());
  }

  @override
  void dispose() {
    valueOnlyChipModel1.dispose();
    valueOnlyChipModel2.dispose();
    debugScreenItemModel1.dispose();
    debugScreenItemModel2.dispose();
    debugScreenItemModel3.dispose();
    valueOnlyChipModel3.dispose();
    valueOnlyChipModel4.dispose();
    debugScreenItemModel4.dispose();
    debugScreenItemModel5.dispose();
    debugScreenItemModel6.dispose();
    debugScreenItemModel7.dispose();
    debugScreenItemModel8.dispose();
  }
}
