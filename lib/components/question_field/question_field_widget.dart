import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'question_field_model.dart';
export 'question_field_model.dart';

class QuestionFieldWidget extends StatefulWidget {
  const QuestionFieldWidget({
    super.key,
    required this.index,
    required this.onChange,
    required this.str,
  });

  final int? index;
  final Future Function(String ques)? onChange;
  final String? str;

  @override
  State<QuestionFieldWidget> createState() => _QuestionFieldWidgetState();
}

class _QuestionFieldWidgetState extends State<QuestionFieldWidget> {
  late QuestionFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionFieldModel());

    _model.questionFieldTextController ??= TextEditingController();
    _model.questionFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        TextFormField(
          controller: _model.questionFieldTextController,
          focusNode: _model.questionFieldFocusNode,
          onChanged: (_) => EasyDebounce.debounce(
            '_model.questionFieldTextController',
            Duration(milliseconds: 2000),
            () async {
              await widget.onChange?.call(
                _model.questionFieldTextController.text,
              );
            },
          ),
          autofocus: false,
          obscureText: false,
          decoration: InputDecoration(
            isDense: true,
            hintText: 'Enter Question ${((widget!.index!) + 1).toString()}',
            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'GoogleSans',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                  useGoogleFonts: false,
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).alternate,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x00000000),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            filled: true,
            fillColor: FlutterFlowTheme.of(context).info,
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'GoogleSans',
                letterSpacing: 0.0,
                useGoogleFonts: false,
              ),
          cursorColor: FlutterFlowTheme.of(context).primaryText,
          validator:
              _model.questionFieldTextControllerValidator.asValidator(context),
        ),
        Text(
          widget!.str!,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'GoogleSans',
                letterSpacing: 0.0,
                useGoogleFonts: false,
              ),
        ),
      ],
    );
  }
}
