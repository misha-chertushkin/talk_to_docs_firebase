import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'individual_menu_item_expanded_model.dart';
export 'individual_menu_item_expanded_model.dart';

class IndividualMenuItemExpandedWidget extends StatefulWidget {
  const IndividualMenuItemExpandedWidget({
    super.key,
    required this.menuTitle,
    required this.selectedIcon,
    required this.positionIndex,
    required this.unselectedIcon,
    this.onClick,
    bool? clickDisabled,
  }) : this.clickDisabled = clickDisabled ?? false;

  final String? menuTitle;
  final Widget? selectedIcon;
  final int? positionIndex;
  final Widget? unselectedIcon;
  final Future Function()? onClick;
  final bool clickDisabled;

  @override
  State<IndividualMenuItemExpandedWidget> createState() =>
      _IndividualMenuItemExpandedWidgetState();
}

class _IndividualMenuItemExpandedWidgetState
    extends State<IndividualMenuItemExpandedWidget> {
  late IndividualMenuItemExpandedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IndividualMenuItemExpandedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget!.clickDisabled) {
          return;
        }

        await widget.onClick?.call();
        FFAppState().selectedMenu = widget!.positionIndex!;
        _model.updatePage(() {});
      },
      child: Container(
        height: 35.0,
        decoration: BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            FFAppState().selectedMenu == widget!.positionIndex
                ? widget!.selectedIcon!
                : widget!.unselectedIcon!,
            if (FFAppState().navOpen)
              Text(
                valueOrDefault<String>(
                  widget!.menuTitle,
                  'My Menu Item',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'GoogleSans',
                      color: FFAppState().selectedMenu == widget!.positionIndex
                          ? Color(0xFF0B57D0)
                          : FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
          ].divide(SizedBox(width: 16.0)),
        ),
      ),
    );
  }
}
