import '/components/button_filled_expanded/button_filled_expanded_widget.dart';
import '/components/individual_menu_item_expanded/individual_menu_item_expanded_widget.dart';
import '/dialog_box/create_new_project_dialog/create_new_project_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_bar_model.dart';
export 'menu_bar_model.dart';

class MenuBarWidget extends StatefulWidget {
  const MenuBarWidget({super.key});

  @override
  State<MenuBarWidget> createState() => _MenuBarWidgetState();
}

class _MenuBarWidgetState extends State<MenuBarWidget> {
  late MenuBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuBarModel());

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

    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      curve: Curves.easeIn,
      width: FFAppState().navOpen ? 300.0 : 120.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(36.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(36.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(36.0, 30.0, 30.0, 36.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 95.0,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (FFAppState().navOpen) {
                        FFAppState().navOpen = false;
                        safeSetState(() {});
                      } else {
                        FFAppState().navOpen = true;
                        safeSetState(() {});
                      }
                    },
                    child: Icon(
                      Icons.menu_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                  ),
                  if (FFAppState().navOpen == true)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/google_cloud_logo.png',
                        width: 170.0,
                        height: 95.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                ].divide(SizedBox(width: 20.0)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 120.0, 0.0, 36.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.individualMenuItemExpandedModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: IndividualMenuItemExpandedWidget(
                          menuTitle: 'Active Projects',
                          selectedIcon: Icon(
                            Icons.chat_bubble,
                            color: Color(0xFF0B57D0),
                            size: 24.0,
                          ),
                          positionIndex: 1,
                          unselectedIcon: Icon(
                            Icons.chat_bubble_outline,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          onClick: () async {
                            context.pushNamed(
                              'chatPage',
                              queryParameters: {
                                'projectId': serializeParam(
                                  FFAppState().projectID,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.individualMenuItemExpandedModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: IndividualMenuItemExpandedWidget(
                          menuTitle: 'My Projects',
                          selectedIcon: Icon(
                            Icons.folder,
                            color: Color(0xFF0B57D0),
                            size: 24.0,
                          ),
                          positionIndex: 2,
                          unselectedIcon: Icon(
                            Icons.folder_open_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          onClick: () async {
                            context.pushNamed(
                              'myProjectsPage',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                        ),
                      ),
                    ].divide(SizedBox(height: 36.0)),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (FFAppState().selectedMenu != 2)
                  Builder(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: CreateNewProjectDialogWidget(),
                            );
                          },
                        );
                      },
                      child: wrapWithModel(
                        model: _model.buttonFilledExpandedModel,
                        updateCallback: () => safeSetState(() {}),
                        child: ButtonFilledExpandedWidget(
                          buttonText: 'Create New Project',
                          leadingButtonIcon: Icon(
                            Icons.add_rounded,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
