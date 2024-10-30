import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'config_field_model.dart';
export 'config_field_model.dart';

class ConfigFieldWidget extends StatefulWidget {
  const ConfigFieldWidget({
    super.key,
    String? title,
    String? value,
    bool? isDropdown,
    bool? viewDetailsAction,
    this.onViewClick,
    bool? isReadOnly,
    bool? hasToolTip,
    String? tooltipOneliner,
    String? tooltipHelperText,
  })  : this.title = title ?? 'ConfigTitle',
        this.value = value ??
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        this.isDropdown = isDropdown ?? false,
        this.viewDetailsAction = viewDetailsAction ?? false,
        this.isReadOnly = isReadOnly ?? false,
        this.hasToolTip = hasToolTip ?? false,
        this.tooltipOneliner = tooltipOneliner ?? 'This is Tooltip Oneliner',
        this.tooltipHelperText = tooltipHelperText ?? 'This is Helper Text';

  final String title;
  final String value;
  final bool isDropdown;
  final bool viewDetailsAction;
  final Future Function()? onViewClick;
  final bool isReadOnly;
  final bool hasToolTip;
  final String tooltipOneliner;
  final String tooltipHelperText;

  @override
  State<ConfigFieldWidget> createState() => _ConfigFieldWidgetState();
}

class _ConfigFieldWidgetState extends State<ConfigFieldWidget> {
  late ConfigFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfigFieldModel());

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
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(0.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).accent4,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget!.title,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'GoogleSans',
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                ),
                AlignedTooltip(
                  content: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'Message...',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'GoogleSans',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  offset: 4.0,
                  preferredDirection: AxisDirection.down,
                  borderRadius: BorderRadius.circular(8.0),
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 4.0,
                  tailBaseWidth: 24.0,
                  tailLength: 12.0,
                  waitDuration: Duration(milliseconds: 100),
                  showDuration: Duration(milliseconds: 1500),
                  triggerMode: TooltipTriggerMode.tap,
                  child: Visibility(
                    visible: widget!.hasToolTip == true,
                    child: Icon(
                      Icons.info_outline,
                      color: Color(0xFFA7A7A7),
                      size: 20.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(),
                  ),
                ),
                if (widget!.viewDetailsAction == true)
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.mode_edit_outlined,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      await widget.onViewClick?.call();
                    },
                  ),
              ].divide(SizedBox(width: 12.0)),
            ),
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Color(0xFFE1E1E1),
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 10.0, 12.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget!.value,
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'GoogleSans',
                              color: valueOrDefault<Color>(
                                widget!.isReadOnly
                                    ? FlutterFlowTheme.of(context).primaryText
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                                Color(0xFF121212),
                              ),
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    if (widget!.isDropdown == true)
                      Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xFFC1C1C1),
                        size: 24.0,
                      ),
                  ],
                ),
              ),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
