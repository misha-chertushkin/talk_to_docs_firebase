import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'individual_menu_item_expanded_widget.dart'
    show IndividualMenuItemExpandedWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IndividualMenuItemExpandedModel
    extends FlutterFlowModel<IndividualMenuItemExpandedWidget> {
  ///  Local state fields for this component.

  List<String> menuItemList = [
    'My Projects',
    'Activity',
    'Prompt Library',
    'Query Settings'
  ];
  void addToMenuItemList(String item) => menuItemList.add(item);
  void removeFromMenuItemList(String item) => menuItemList.remove(item);
  void removeAtIndexFromMenuItemList(int index) => menuItemList.removeAt(index);
  void insertAtIndexInMenuItemList(int index, String item) =>
      menuItemList.insert(index, item);
  void updateMenuItemListAtIndex(int index, Function(String) updateFn) =>
      menuItemList[index] = updateFn(menuItemList[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
