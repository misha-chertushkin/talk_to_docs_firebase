import '/components/debug_screen_item/debug_screen_item_widget.dart';
import '/components/document_or_project_card/document_or_project_card_widget.dart';
import '/components/value_only_chip/value_only_chip_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'debug_panel_dialog_model.dart';
export 'debug_panel_dialog_model.dart';

class DebugPanelDialogWidget extends StatefulWidget {
  const DebugPanelDialogWidget({
    super.key,
    required this.timeTaken,
    required this.confidenceScore,
    required this.previousContext,
    required this.question,
    required this.finalResponse,
    required this.roundInfoList,
    required this.roundDocList,
  });

  final String? timeTaken;
  final String? confidenceScore;
  final String? previousContext;
  final String? question;
  final String? finalResponse;
  final List<dynamic>? roundInfoList;
  final List<String>? roundDocList;

  @override
  State<DebugPanelDialogWidget> createState() => _DebugPanelDialogWidgetState();
}

class _DebugPanelDialogWidgetState extends State<DebugPanelDialogWidget> {
  late DebugPanelDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DebugPanelDialogModel());

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
      width: 900.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(36.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(30.0, 36.0, 30.0, 36.0),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 110.0, 0.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.valueOnlyChipModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: ValueOnlyChipWidget(
                            parameterTitle: 'Confidence Score:',
                            parameterValue: widget!.confidenceScore!,
                            parameterIcon: Icon(
                              Icons.grain_outlined,
                              color: Color(0xFF0B57D0),
                              size: 24.0,
                            ),
                            fillColor:
                                FlutterFlowTheme.of(context).secondryButtonBg,
                            strokeColor:
                                FlutterFlowTheme.of(context).secondryButtonBg,
                            textColor: Color(0xFF0B57D0),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.valueOnlyChipModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: ValueOnlyChipWidget(
                            parameterTitle: 'Time Taken(seconds):',
                            parameterValue: widget!.timeTaken!,
                            parameterIcon: Icon(
                              Icons.grain_outlined,
                              color: Color(0xFF0B57D0),
                              size: 24.0,
                            ),
                            fillColor:
                                FlutterFlowTheme.of(context).secondryButtonBg,
                            strokeColor:
                                FlutterFlowTheme.of(context).secondryButtonBg,
                            textColor: Color(0xFF0B57D0),
                          ),
                        ),
                      ].divide(SizedBox(width: 20.0)),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.debugScreenItemModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: DebugScreenItemWidget(
                          title: 'Question',
                          text: widget!.question,
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.debugScreenItemModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: DebugScreenItemWidget(
                        title: 'Final Response',
                        text: widget!.finalResponse,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.debugScreenItemModel3,
                      updateCallback: () => safeSetState(() {}),
                      child: DebugScreenItemWidget(
                        title: 'Previous Context',
                        text: widget!.previousContext,
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        final rounds = widget!.roundInfoList!.toList();

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children:
                                List.generate(rounds.length, (roundsIndex) {
                              final roundsItem = rounds[roundsIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.selectedRoundIndex = roundsIndex;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 120.0,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Round ${(roundsIndex + 1).toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'GoogleSans',
                                                color:
                                                    _model.selectedRoundIndex ==
                                                            roundsIndex
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Divider(
                                          thickness: 2.5,
                                          color: _model.selectedRoundIndex ==
                                                  roundsIndex
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.valueOnlyChipModel3,
                              updateCallback: () => safeSetState(() {}),
                              child: ValueOnlyChipWidget(
                                parameterTitle: 'Confidence Score:',
                                parameterValue: getJsonField(
                                  widget!.roundInfoList![
                                      _model.selectedRoundIndex!],
                                  r'''$.confidence_score''',
                                ).toString(),
                                parameterIcon: Icon(
                                  Icons.grain_outlined,
                                  color: Color(0xFFA7A7A7),
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                strokeColor:
                                    FlutterFlowTheme.of(context).accent4,
                                textColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            wrapWithModel(
                              model: _model.valueOnlyChipModel4,
                              updateCallback: () => safeSetState(() {}),
                              child: ValueOnlyChipWidget(
                                parameterTitle: 'Time Taken(seconds):',
                                parameterValue: getJsonField(
                                  widget!.roundInfoList![
                                      _model.selectedRoundIndex!],
                                  r'''$.time_taken''',
                                ).toString(),
                                parameterIcon: Icon(
                                  Icons.grain_outlined,
                                  color: Color(0xFFA7A7A7),
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                strokeColor:
                                    FlutterFlowTheme.of(context).accent4,
                                textColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                          ].divide(SizedBox(width: 20.0)),
                        ),
                        wrapWithModel(
                          model: _model.debugScreenItemModel4,
                          updateCallback: () => safeSetState(() {}),
                          child: DebugScreenItemWidget(
                            title: 'Answer',
                            text: getJsonField(
                              widget!
                                  .roundInfoList?[_model.selectedRoundIndex!],
                              r'''$.answer''',
                            ).toString(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 3.0, 0.0),
                          child: wrapWithModel(
                            model: _model.debugScreenItemModel5,
                            updateCallback: () => safeSetState(() {}),
                            child: DebugScreenItemWidget(
                              title: 'Context Used',
                              text: getJsonField(
                                widget!
                                    .roundInfoList?[_model.selectedRoundIndex!],
                                r'''$.context_used''',
                              ).toString(),
                            ),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.debugScreenItemModel6,
                          updateCallback: () => safeSetState(() {}),
                          child: DebugScreenItemWidget(
                            title: 'Follow up question',
                            text: getJsonField(
                              widget!
                                  .roundInfoList?[_model.selectedRoundIndex!],
                              r'''$.additional_info_to_retrieve''',
                            ).toString(),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.debugScreenItemModel7,
                          updateCallback: () => safeSetState(() {}),
                          child: DebugScreenItemWidget(
                            title: 'Plan & Summaries',
                            text: getJsonField(
                              widget!
                                  .roundInfoList?[_model.selectedRoundIndex!],
                              r'''$.plan_and_summaries''',
                            ).toString(),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.debugScreenItemModel8,
                          updateCallback: () => safeSetState(() {}),
                          child: DebugScreenItemWidget(
                            title: 'Document Details',
                            text: getJsonField(
                              widget!
                                  .roundInfoList?[_model.selectedRoundIndex!],
                              r'''$.retrieved_document_details''',
                            ).toString(),
                          ),
                        ),
                        if (getJsonField(
                              widget!
                                  .roundInfoList?[_model.selectedRoundIndex!],
                              r'''$.retrieved_document_names''',
                            ) !=
                            null)
                          Text(
                            'Documents',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'GoogleSans',
                                      color: Color(0xFF717171),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                          ),
                      ].divide(SizedBox(height: 20.0)),
                    ),
                    Builder(
                      builder: (context) {
                        final docs = getJsonField(
                          widget!.roundInfoList?[_model.selectedRoundIndex!],
                          r'''$.retrieved_document_names''',
                        ).toList();

                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 4.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: docs.length,
                          itemBuilder: (context, docsIndex) {
                            final docsItem = docs[docsIndex];
                            return DocumentOrProjectCardWidget(
                              key: Key('Keyku9_${docsIndex}_of_${docs.length}'),
                              documentorProjectName: docsItem.toString(),
                              icon: Icon(
                                Icons.insert_drive_file,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ]
                      .divide(SizedBox(height: 24.0))
                      .addToEnd(SizedBox(height: 50.0)),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bug_report,
                        color: Color(0xFF0B57D0),
                        size: 24.0,
                      ),
                      Text(
                        'Debug',
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: 'GoogleSans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 0.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
